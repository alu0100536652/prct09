require "spec_helper"
require "List/List"

describe "Module List" do
    
    describe "List" do
 
        before :each do
            authors=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
            editorial="Pragamatic Book"
            date="July 7, 2013"
            @ref = List::Bibliography.new(title, authors, editorial, date)
            
            authors=['Dave Thomas']
            title="Programming JavaScript"
            editorial="W3School"
            date="July 20, 2015"
            @ref1 = List::Bibliography.new(title, authors, editorial, date)
            
            @list = List::List.new
            @list2 = List::List.new
            @list2.add(@ref)
            @list2.add(@ref1)
        end
    
        it "Debemos obtener la cabeza de la lista" do
            expect(@list.head).to eq(nil)
        end
        
        it "Debemos obtener la cola de la lista" do
            expect(@list.tail).to eq(nil)
        end
        
        it "Lista vacia" do
            expect(@list.length).to eq(0)
        end
        
        it "Debemos poder añadir valores" do
            expect(@list2.length).to eq(2)
        end
        
        it "Debemos poder obtener un valor" do
            expect(@list2[0]).to eq(@ref)
        end
        
        it "Debemos poder setear un valor" do
            expect(@list2[0]= 1000).to eq(1000)
        end
        
        it "Debemos poder eliminar un valor" do
            @list2.remove(0)
            expect(@list2.length).to eq(1)
        end
        
        it "Debemos poder obtener el primero" do
            @list2.add(300)
            expect(@list2.first()).to eq(@ref)
        end
        
        it "Debemos poder obtener el ultimo" do
            @list2.add(300)
            expect(@list2.last()).to eq(300)
        end
        
        it "Borrar todos los elementos de la lista" do
            @list2.clear()
            expect(@list2.length).to eq(0)
        end
    end
    
    
    describe "Bibliography" do
        
        before :each do
            @authors=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            @title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
            @editorial="Pragamatic Book"
            @date="July 7, 2013"
            @ref = List::Bibliography.new(@title, @authors, @editorial, @date)
        end
    
        it "La bibliografia estandar debe tener un titulo" do
            expect(@ref.title).to eq(@title)
        end
        
        it "La bibliografia estandar debe tener autores" do
            expect(@ref.author).to eq(@authors)
        end
        
        it "La bibliografia estandar debe tener un editorial" do
            expect(@ref.editorial).to eq(@editorial)
        end
        
        it "La bibliografia estandar debe tener una fecha" do
            expect(@ref.date).to eq(@date)
        end
        
        it "Bibliografia a cadena de texto" do
            expect(@ref.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\nPragamatic Book;(July 7, 2013)")
        end
    
    end
    
    describe "Book" do
        before :each do
            @author=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            @title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
            @editorial="Pragamatic Book"
            @edition="4 edition"
            @date="July 7, 2013"
            @isbn=['123789','456789']
            @book = List::Book.new(@title,@author, @editorial, @edition, @date, @isbn)
        end
        
        it "El libro ha de tener una edicion" do
            expect(@book.edition).to eq(@edition)
        end
        
        it "El libro ha de tener isbn" do
            expect(@book.isbn).to eq(@isbn)
        end
        
        it "El libro puede tener o no un serial" do
            serial="(The Facets of Ruby)"
            @book.addSerial(serial)
            expect(@book.serial).to eq(serial)
        end
    end
    
    
    describe "Releases" do
        before :each do
            @author=['Dave Thomas', 'Andy Hunt', 'Chad Fowler']
            @title="Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide"
            @editorial="Pragamatic Book"
            @date="July 7, 2013"
            @sumary= "Ruby programming in web environments"
            @text = "Content of the Release"
            @book = List::Release.new(@title,@author, @editorial, @date, @sumary, @text)
        end
        
        it "La publicacion ha de tener un resumen" do
            expect(@book.sumary).to eq(@sumary)
        end
        
        it "La publicacion ha de tener un resumen" do
            expect(@book.text).to eq(@text)
        end
        
    end

end