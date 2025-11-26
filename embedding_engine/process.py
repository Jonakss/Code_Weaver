# embedding_engine/process.py

import os
import chromadb
from chromadb.utils import embedding_functions
from tqdm import tqdm
import markdown
from bs4 import BeautifulSoup

# --- Configuración ---
DOCS_DIRECTORY = "../docs"
CHROMA_DB_PATH = "db"
COLLECTION_NAME = "code_weaver_docs"
CHUNK_SIZE = 1000  # Caracteres por fragmento
CHUNK_OVERLAP = 100 # Superposición entre fragmentos para mantener contexto

def get_markdown_files(directory):
    """Encuentra todos los archivos .md en el directorio y subdirectorios."""
    markdown_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".md"):
                markdown_files.append(os.path.join(root, file))
    return markdown_files

def markdown_to_text(markdown_content):
    """Convierte Markdown a texto plano para un procesamiento más limpio."""
    html = markdown.markdown(markdown_content)
    soup = BeautifulSoup(html, "html.parser")
    return soup.get_text()

def create_chunks(text, size, overlap):
    """Divide el texto en fragmentos (chunks) con superposición."""
    chunks = []
    start = 0
    while start < len(text):
        end = start + size
        chunks.append(text[start:end])
        start += size - overlap
    return chunks

def main():
    """Función principal para procesar los documentos y generar embeddings."""
    print("Iniciando el procesamiento de la documentación...")

    # 1. Encontrar todos los archivos de documentación
    markdown_files = get_markdown_files(DOCS_DIRECTORY)
    if not markdown_files:
        print(f"No se encontraron archivos .md en '{DOCS_DIRECTORY}'. Abortando.")
        return
    print(f"Se encontraron {len(markdown_files)} archivos para procesar.")

    # 2. Cargar el contenido de los archivos
    documents = []
    for file_path in markdown_files:
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                documents.append({"path": file_path, "content": content})
        except Exception as e:
            print(f"Error al leer el archivo {file_path}: {e}")
            
    # 3. Inicializar ChromaDB y el modelo de embeddings
    # Usará el modelo 'all-MiniLM-L6-v2' por defecto, que se descarga automáticamente.
    sentence_transformer_ef = embedding_functions.SentenceTransformerEmbeddingFunction()
    
    # El cliente persistirá la base de datos en el directorio 'db'
    client = chromadb.PersistentClient(path=CHROMA_DB_PATH)
    
    # Crear o obtener la colección
    collection = client.get_or_create_collection(
        name=COLLECTION_NAME,
        embedding_function=sentence_transformer_ef,
        metadata={"hnsw:space": "cosine"} # Usar similitud de coseno
    )

    # 4. Procesar cada documento: chunking, embedding y almacenamiento
    print("Procesando documentos, generando embeddings y almacenando en la base de datos...")
    doc_id_counter = 0
    for doc in tqdm(documents, desc="Procesando documentos"):
        file_path = doc["path"]
        
        # Convertir a texto plano y crear fragmentos
        plain_text = markdown_to_text(doc["content"])
        chunks = create_chunks(plain_text, CHUNK_SIZE, CHUNK_OVERLAP)

        if not chunks:
            continue

        # Crear IDs únicos para cada fragmento
        ids = [f"{file_path}_{i}" for i in range(len(chunks))]
        
        # Generar embeddings y almacenar en ChromaDB
        # La librería se encarga de llamar a la embedding_function automáticamente
        collection.add(
            ids=ids,
            documents=chunks,
            metadatas=[{"source": file_path} for _ in chunks]
        )
        doc_id_counter += len(chunks)

    print("\n--- Proceso completado ---")
    print(f"Se han procesado y almacenado {doc_id_counter} fragmentos de documentos.")
    print(f"La base de datos vectorial está lista en: '{CHROMA_DB_PATH}/{COLLECTION_NAME}'")
    print(f"Total de documentos en la colección: {collection.count()}")

if __name__ == "__main__":
    main()
