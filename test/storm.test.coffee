describe 'storm',->
  storm = undefined
  beforeEach ->
    storm = angular.module 'storm',['ngBaas']
  it 'shuld be exist storm',->
    expect(storm).toBeDefined()