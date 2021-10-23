class SearchRole
  def initialize(query)
    @query = query
  end

  def get_role
    if @query =~ /(r|R){1}(e|E){1}(c|C){1}(r|R)?(u|U)?(i|I)?(t|T)?(e|E)?(r|R)?/
      @role = 1
    elsif @query =~ /(c|C){1}(a|A){1}(n|N){1}(d|D)?(i|I)?(d|D)?(a|A)?(t|T)?(e|E)?/
      @role = 0
    end
  end
end
