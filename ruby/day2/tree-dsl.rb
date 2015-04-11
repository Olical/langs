# Class from the book.
# I'm adding the easy construction with a map.
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @node_name = name
    @children = children

    if children.is_a?(Hash)
      @children = children.map {|key, value| Tree.new(key, value)}
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

family = Tree.new('family', {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
})

family.visit_all {|node| puts node.node_name}
