# -*- encoding : utf-8 -*-
#encoding: UTF-8

class Document < ActiveRecord::Base
  
  belongs_to :transaction
  mount_uploader :doc, DocumentUploader
  
  def detect_format
    @format = doc.file.extension.upcase
    case @format
    when "DOC", "DOCX", "DOT", "DOTX"
      ("file_doc.png")
    when "JPG", "JPEG", "GIF"
      ("file_jpg.png")
    when "PNG"
      ("file_png.png")
    when "BMP"
      ("file_bmp.png")
    when "PPT", "PPTX"
      ("file_ppt.png")
    when "RTF"
      ("file_rtf.png")
    when "TXT"
      ("file_txt.png")
    when "XLSX", "XLS", "XLTX", "XLT", "CSV"
      ("file_xls.png")
    when "XML", "HTM", "HTML"
      ("file_html.png")
    when "PDF"
      ("file_pdf.png")
    end
  end
  
end