class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.text_body = parse_document(@document.file)

    if @document.save!
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  private

    def document_params
      params.require(:document).permit(:file)
    end

    def parse_document(doc)
      reader = Yomu.new(doc.path)

      reader.text
    end
end
