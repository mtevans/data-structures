function equilibrium(A) {
  var right = 0 ;
  for (var i = 0; i < A.length; i++) {
    right += A[i]
  }
  var left = 0;
  for (var i = 0; i < A.length; i++) {
    if(i > 0){
      left += A[i - 1]
    }
    right -= A[i]
    if( right === left ){
      return i
    }
  }

  return -1


}
