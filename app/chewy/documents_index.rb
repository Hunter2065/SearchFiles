class DocumentsIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      text_body: {
        tokenizer: 'keyword',
        filter: ['lowercase', 'word_delimiter']
      }
    }
  }

  index_scope Document
  field :text_body, analyzer: 'text_body'
end
