  class DeDoDrop
    def initialize(params)
      name = params.fetch(:name,params.fetch(:model)).downcase
      child = params.fetch(:has_many).downcase.chop
      @all_models = eval params.fetch(:model)+".all"
      @menu = {name: name, 
               has_many: params.fetch(:has_many).downcase,
               parents: [["Select #{name}", nil]],
               children: [["Select #{name} first", nil, {id:"dedodrop-kill"}],["Select option","-"]]}
      @menu[:parents] += get_parents(params)
      @menu[:children] += get_children(params)
    end
  
    def menu
      @menu
    end
  
    private
  
    def get_parents(params)
      model_attr_st = "model.#{params.fetch(:model_attr)}"
      @all_models.map do |model|
        model_attr = eval model_attr_st
        [model_attr, model.id, {class: "hi"}]
      end
    end
  
    def get_children(params)
      has_many = params.fetch(:has_many)
      children_st = "model.#{has_many}"
      child_attr_st ="child.#{params.fetch(:child_attr)}"
      children = []
      @all_models.map do |model|
        model_children = eval children_st
        children += model_children.map do |child|
          child_attr = eval child_attr_st
          [child_attr, child.id, {class: ["dedodrop-hidden", "dedodrop-id#{model.id}"]}]
        end
      end
      children
    end
  
    def self.procfy(string)
      string = "proc{#{string}}"
    end
  end