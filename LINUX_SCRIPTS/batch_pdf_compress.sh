#!/bin/bash

if ! command -v gs &> /dev/null; then
    echo "Ghostscript is not installed. Please install Ghostscript and try again."
    exit 1
fi

pdf_files=( *.pdf )
if [ ${#pdf_files[@]} -eq 0 ]; then
    echo "No PDF files found in the current directory."
    exit 1
fi

output_dir="compressed_pdfs"
mkdir -p "$output_dir"

for pdf_file in "${pdf_files[@]}"; do
    output_file="$output_dir/$(basename "$pdf_file" .pdf)_compressed.pdf"
    
    echo "Compressing $pdf_file..."
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$output_file" "$pdf_file"
    
    echo "Compressed file saved as $output_file"
done

echo "Compression complete. Compressed PDFs are saved in the '$output_dir' directory."
