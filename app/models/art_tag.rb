class ArtTag < ActiveHash::Base
  self.data = [
      {id: 1, name: 'Ruby'}, {id: 2, name: 'Python'}, {id: 3, name: 'Git'}, {id: 4, name: 'JAVA'},{id: 5, name:'SQL'}, {id: 6, name: 'AWS'}
  ]
end


#配列に文字列を入れてeach文で取り出せばもう少し簡単な構造にできそう