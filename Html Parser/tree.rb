class Tree_Node
 attr_accessor :tags,:child,:parent,:name,:property
 def initialize
   @tags=[]
   @child=[]
   @property=""
 end
end

class Tree
 attr_accessor :standard_tags
 def initialize
    @root=Tree_Node.new
    @root.name='<html>'
    @root.child=[]
    @root.parent=nil
  # @@standard_tags=["body","div","head","img"]
 end

def start
 puts"    HTML Parsing  "
 puts "1. Parse Html File"
 puts "2. Print All Tags"
 puts "3. Find Content With ID"
 puts "4. Find All Content Within A Parent"
 puts "5. Print Tree HTML DOM"
 puts "Enter Your Choice Operation: "
 choice = gets.chomp()
 case choice
   when '1'
      parse_html
   when '2'

   else
     puts "Invalid Choice Entered"
   end
end

 def parse_html
   puts "Processing the html file......"
   puts "Printing the Input file......."
   @content=""
   File.open('parsing.html').each do |line|
     puts line
     @content=@content+line
   end
   @tags = @content.scan(/(<(?:"[^"]*"['"]*|'[^']*'['"]*|[^'">])+>)/)
   @tags = @tags.flatten
   puts "Printing Tags Present In The Html File......"
   puts @tags
   generate_tree(@root,@tags,1,(@tags.length-2))
   start_index=1
   start_tag=@tags[1]
   while(start_index!= @tags.length-1)
     start_index=@tags.index(closing_tag(start_tag))+1
     start_tag = @tags[start_index]
     generate_tree(@root,@tags,start_index,(@tags.length-2))
     start_index = @tags.index(closing_tag(start_tag))+1
 end
   @root.child.each do |children|
     p "child:  "+children.name
     p "parent:"+children.parent.name
   end

 end

def closing_tag(tag)
  arr = tag.split('')
  arr.insert(1,'/')
  return arr.join('').to_s
end


def is_closing_tag?(tag)
  if(tag.include?('/'))
    return true
  else
    return false
  end
end

def generate_tree(node,tags,start_index,end_index)
  puts "node recieved:- "+node.name
  puts start_index
  puts end_index
  puts tags[start_index..end_index]
  @node = Tree_Node.new
  @node.name=tags[start_index]
  @node.parent=node
  @node.child=[]
  node.child.push(@node)
  p @node.name
  p index_start=tags.index(@node.name)
  p index_end= tags.index(closing_tag(@node.name))
  if(end_index-start_index==1)
    return
  end
  generate_tree(@node,tags,index_start+1,index_end-1)
 end
end


Tree.new.start
