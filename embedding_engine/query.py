# embedding_engine/query.py

import chromadb
from chromadb.utils import embedding_functions
import argparse

# --- Configuración ---
CHROMA_DB_PATH = "db"
COLLECTION_NAME = "code_weaver_docs"

def main():
    """Función principal para consultar la base de datos de embeddings."""
    
    # --- Argumentos de línea de comandos ---
    parser = argparse.ArgumentParser(description="Consulta la base de conocimientos de Code Weaver.")
    parser.add_argument("--query", "-q", type=str, required=True, help="La pregunta que deseas hacer a la documentación.")
    parser.add_argument("--results", "-n", type=int, default=5, help="Número de resultados a devolver.")
    args = parser.parse_args()

    # 1. Inicializar el cliente de ChromaDB
    try:
        client = chromadb.PersistentClient(path=CHROMA_DB_PATH)
        sentence_transformer_ef = embedding_functions.SentenceTransformerEmbeddingFunction()
        
        collection = client.get_collection(
            name=COLLECTION_NAME,
            embedding_function=sentence_transformer_ef
        )
    except Exception as e:
        print(f"Error al conectar con la base de datos en '{CHROMA_DB_PATH}'.")
        print(f"Asegúrate de haber ejecutado 'process.py' primero para crear la base de datos.")
        print(f"Error original: {e}")
        return

    # 2. Realizar la consulta
    results = collection.query(
        query_texts=[args.query],
        n_results=args.results,
    )

    # 3. Mostrar los resultados
    print(f"\nResultados para la consulta: \"{args.query}\"\n")

    if not results or not results.get('documents'):
        print("No se encontraron resultados relevantes.")
        return

    documents = results['documents'][0]
    metadatas = results['metadatas'][0]
    distances = results['distances'][0]

    for i, (doc, meta, dist) in enumerate(zip(documents, metadatas, distances)):
        source = meta.get('source', 'Desconocido')
        # Limpiar el texto para una mejor visualización
        clean_doc = ' '.join(doc.split())
        
        print(f"--- Resultado {i+1} ---")
        print(f"Fuente: {source}")
        print(f"Distancia: {dist:.4f} (menor es mejor)")
        print(f"Contenido:\n{clean_doc}\n")
        
if __name__ == "__main__":
    main()
