# Gemini RAG LLM PDF Parser Using Google Gemini Model

## Description

The **Gemini RAG LLM PDF Parser Using Google Gemini Model** is a tool designed to extract text from PDF files, split it into manageable chunks, and query the text using Google’s Gemini generative AI model. The system is particularly useful for asking questions about PDF contents and getting responses directly from the AI model. By leveraging Google’s generative AI, this tool can handle complex questions, providing relevant answers based on the parsed text.

The project comprises the following main functionalities:
1. **Text Extraction**: Reads text from a PDF file, decrypting it if needed.
2. **Chunk Splitting**: Splits large amounts of text into chunks to meet the Gemini API's maximum character limit.
3. **Querying Gemini**: Sends the query to the Gemini model for each text chunk, generating AI-driven responses.

### Project Structure and Execution Flow

- **`query_data_gemini.py`**: This script extracts text from the PDF, splits it into chunks, and sends each chunk along with the user’s query to the Google Gemini model. It’s the main script you’ll interact with to query information from PDF files.
- **Dockerfile**: A Docker configuration file that creates an isolated environment for running the script, ensuring consistent behavior across systems.

Each component of this project is designed to make it easy to query and retrieve specific information from a PDF document, enabling you to use natural language queries for faster, more relevant responses.

## Code Overview

- **`extract_text_from_pdf(pdf_path, password=None)`**: Reads and decrypts (if needed) a PDF, then extracts text from each page.
- **`split_text_into_chunks(text, max_size)`**: Splits the extracted text into chunks of manageable size for the API.
- **`query_gemini(prompt)`**: Sends a prompt to Google Gemini and retrieves the generated response.
- **`query_pdf(pdf_path, query_text, password=None)`**: Combines the above functions to read, chunk, and query the PDF text using the Gemini API.

### Sequence of Execution

1. **Extract Text**: Reads the entire PDF file’s contents, decrypting if necessary.
2. **Split into Chunks**: Splits the text to ensure each chunk fits within the Gemini API's input size limits.
3. **Query Gemini**: Each chunk is queried separately using the Gemini model to retrieve responses.
4. **Aggregate Results**: Displays responses for each chunk, allowing you to analyze responses to your query across the document.

## Requirements

- **Python 3.8+**
- **Docker** (if running via Docker)

## Dependencies

The following Python packages are required:
- `PyPDF2`: For reading and decrypting PDF files.
- `google-generativeai`: For interfacing with Google Gemini API.
- `argparse`: For parsing command-line arguments.

### Environment Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/AdityaShah346/Gemini_RAG_LLM.git
   cd Gemini_RAG_LLM
   ```

2. **Install the required Python packages**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Set up your Google Gemini API Key**:
   - Replace `API_KEY` in `query_data_gemini.py` with your own Google Gemini API key.
   - Alternatively, set an environment variable for the API key to keep it secure:
     ```bash
     export GEMINI_API_KEY="your_google_gemini_api_key"
     ```

### Usage

To query a PDF file, use the following steps.

#### Step 1: Run `query_data_gemini.py`

Run the script, providing the path to your PDF file, your query, and an optional password if the PDF is encrypted.

```bash
python query_data_gemini.py path/to/yourfile.pdf "Your query text" --password your_password
```

Replace:
- `path/to/yourfile.pdf` with the actual path to your PDF file.
- `"Your query text"` with the question you want to ask about the PDF’s contents.
- `--password your_password` (optional) if your PDF is password-protected.

### Example

```bash
python query_data_gemini.py data/sample.pdf "What is the main topic discussed in this document?" --password 1234
```

## Docker Usage

You can also run this project using Docker, which encapsulates the environment and dependencies, ensuring it works consistently across different systems.

### Using the Pre-built Docker Image

If you want to use the pre-built Docker image, you can pull it directly from Docker Hub and run it without building the image manually.

#### Step 1: Pull the Docker Image

Run the following command to pull the Docker image from Docker Hub:

```bash
docker pull adityashah346/pdf-query-gemini:latest
```

#### Step 2: Run the Docker Container

Use the following command to run the Docker container, passing in the necessary arguments. Replace `"your_google_gemini_api_key"` with your actual API key:

```bash
docker run -e GEMINI_API_KEY="your_google_gemini_api_key" -v path_to_your_pdf:/app/pdf_file.pdf adityashah346/pdf-query-gemini:latest "/app/pdf_file.pdf"
```

Explanation:
- `-e GEMINI_API_KEY="your_google_gemini_api_key"`: Sets the API key as an environment variable inside the container.
- `-v path_to_your_pdf:/app/pdf_file.pdf`: Mounts your local PDF file to `/app/pdf_file.pdf` inside the container.
- `adityashah346/pdf-query-gemini:latest`: The pre-built Docker image from Docker Hub.
- `"/app/pdf_file.pdf"`: The file path inside the container for the PDF file.

#### Example Docker Command

```bash
docker run -e GEMINI_API_KEY="your_google_gemini_api_key" -v $(pwd)/data/sample.pdf:/app/pdf_file.pdf adityashah346/pdf-query-gemini:latest "/app/pdf_file.pdf"
```

### Building and Running Docker Locally

If you prefer to build the Docker image locally, you can follow these steps.

#### Step 1: Build the Docker Image

Run the following command to build the Docker image:

```bash
docker build -t gemini_rag_llm .
```

#### Step 2: Run the Docker Container

Use the following command to run the Docker container, passing in the necessary arguments. Replace `"your_google_gemini_api_key"` with your actual API key:

```bash
docker run -e GEMINI_API_KEY="your_google_gemini_api_key" -v $(pwd):/app gemini_rag_llm path/to/yourfile.pdf "Your query text" --password your_password
```

Explanation:
- `-e GEMINI_API_KEY="your_google_gemini_api_key"`: Sets the API key as an environment variable inside the container.
- `-v $(pwd):/app`: Mounts the current directory to `/app` in the container, so the PDF file can be accessed.
- `gemini_rag_llm`: The name of your Docker image.
- `path/to/yourfile.pdf`: Replace with the path to your PDF file.
- `"Your query text"`: Replace with your query.
- `--password your_password`: Optional, only if your PDF is encrypted.

#### Example Docker Command

```bash
docker run -e GEMINI_API_KEY="your_google_gemini_api_key" -v $(pwd):/app gemini_rag_llm data/sample.pdf "What is the main topic?" --password 1234
```

## Contributor

- **Aditya Shah**: Created this project independently. [GitHub Profile](https://github.com/AdityaShah346)

## Additional Information

This project leverages Google’s generative AI to answer queries on the contents of PDF documents, making it a versatile tool for retrieving structured information from large documents. By using Docker, it’s easy to deploy this project in a self-contained environment, ensuring that the dependencies are managed consistently.

For future improvements, we may consider adding support for other document formats or optimizing the chunking function to handle various document structures effectively.
