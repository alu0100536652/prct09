module List
    
    class List
        attr_reader :head, :length, :tail
        Node = Struct.new(:value, :next, :prev)
        
        def initialize
            @length = 0
        end
        
        def add(valueToAdd)
            if @head.nil?
                nodeList = Node.new(valueToAdd,nil,nil)
                @head = nodeList
                @tail = nodeList
            else
                nodeList = Node.new(valueToAdd,nil,@tail)
                @tail.next = nodeList 
                @tail = nodeList
            end
            @length += 1
        end
        
        def remove(index)
            if index == 0
                @head = @head.next
                @head.prev = nil
            else
                temp = @head
                counter = 0
                while counter < index do                 
                    temp = temp.next
                    counter += 1
                end
                
                previousToRemove = temp.prev
                temp.next = previousToRemove.next
            end
            @length -= 1
        end
        
        def [](index)
            temp = @head
            counter = 0
            while counter < index do
                temp = temp.net
                counter += 1
            end
            temp.value
        end
        
        def []=(index,valueToAdd)
            temp = @head
            counter = 0
            while counter < index do                 
                temp = temp.next
                counter += 1
            end
            temp.value = valueToAdd
        end
        
        def first()
            @head.value
        end
        
        def last()
            @tail.value
        end
        
        def clear
            @head = nil
            @tail = nil
            @length = 0
        end
        
    end
    
    class Bibliography
        attr_reader :author, :title, :editorial, :date
        include Comparable
        
        def initialize(title,author, editorial, date)
            if author == nil || author == 0
                raise ArgumentError, 'Tiene que tener como minimo un autor'
            end
            @author = author
    
            if title == nil
                raise ArgumentError, 'Tiene que tener un titulo'
            end
            @title = title
    
            if editorial == nil
                raise ArgumentError, 'Tiene que tener una editorial'
            end
            @editorial = editorial
    
            if date == nil 
                raise ArgumentError, 'Tiene que tener una fecha'
            end
            @date = date
        end
        
        def <=>(value)
            [@author, @title, @editorial, @date] <=> [value.author, value.title, value.editorial, value.date]
        end
        
        def to_s
            authors = ""
            counter = @author.count - 1
            @author.each_with_index  do |author, index|
                if index < counter
                    authors += author + ", "
                else
                    authors += author
                end
            end
            "#{authors}\n#{@title}\n#{@editorial};(#{@date})"
        end
        
    end
    
    class Book < Bibliography
        attr_reader :serial, :edition, :isbn
    
        def initialize(title, author, editorial, edition, date, isbn)
            
            super(title, author, editorial, date)
            
            if edition == nil
                raise ArgumentError, 'Tiene que tener una edicion'
            end
            @edition = edition
    
    
            if isbn == nil || isbn == 0
                raise ArgumentError, 'Tiene que tener como minimo un isbn'
            end
            @isbn = isbn
        end
        
        def addSerial(serial)
            @serial = serial
        end
    end
    
    class Release < Bibliography
        attr_reader :sumary, :text
    
        def initialize(title, author, editorial, date, sumary, text)
            
            super(title, author, editorial, date)
            
            if sumary == nil
                raise ArgumentError, 'Tiene que tener un resumen'
            end
            @sumary = sumary
    
    
            if text == nil || text == 0
                raise ArgumentError, 'Tiene que tener un contenido'
            end
            @text = text
        end
    end

end
