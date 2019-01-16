-- SQL Advanced Select

# Type of Triangle

SELECT IF(A + B <= C or A + C <= B or B + C <= A, 'Not A Triangle', IF(A = B and A = C, 'Equilateral', IF(A = B or A = C or B = C, 'Isosceles', 'Scalene')))
FROM TRIANGLES