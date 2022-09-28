# K-NEAREST NEIGHBORS EXERCISE – ASSIGNMENT  UNIT 4
#
# Imaging objects in classes A and B having two numeric attributes/properties that we map to X and Y Cartesian coordinates so that we can plot class instances (cases) as points on a 2-D chart. In other words, our cases are represented as points with X and Y coordinates (p(X,Y)).
#
# Our simple classes A and B will have 3 object instances (cases) each.
#
# Class A will include points with coordinates (0,0), (1,1), and (2,2).
# Class B will include points with coordinates (6,6), (5.5, 7), and (6.5, 5).
#
# In R, we can write down the above arrangement as follows:
#
# # Class A training object instances (cases)
#
A1 <- c(0, 0)
A2 <- c(1, 1)
A3 <- c(2, 2)
#
# # Class B training objects instances (cases)
#
B1 <- c(6, 6)
B2 <- c(5.5, 7)
B3 <- c(6.5, 5)
#
# How are the classification training objects for class A and class B arranged on a chart?
#
#
a <- rbind(A1, A2, A3)
b <- rbind(B1, B2, B3)
plot(a, col='red', xlab = 'x', ylab = 'y', xlim = c(0,10), ylim = c(0,10))
points(b, col='blue')
#
#
# The knn() function is housed in the class package and is invoked as follows:
#
# knn(train, test, cl, k)
#
# where
#
# train is a matrix or a data frame of training (classification) cases
# test is a matrix or a data frame of test case(s) (one or more rows)
# cl is a vector of classification labels (with the number of elements matching the number of classes in the training data set)
# k is an integer value of closest cases (the k in the k-Nearest Neighbor Algorithm); normally, it is a small odd integer number
#
# Now, when we try out classification of a test object (with properties expressed as X and Y coordinates), the kNN algorithm will use the Euclidean distance metric calculated for every row (case) in the training matrix to find the closest one for k=1 and the majority of closest ones for k > 1 (where k should be an odd number).
#
# •    Construct the cl parameter (the vector of classification labels).

cl <- c('A', 'A', 'A', 'B', 'B', 'B')

#
# To run the knn() function, we need to supply the test case(s), which corresponds to a point sitting approximately in the middle of the distance between A and B. suppose
# test=c(4,4)
#
# At this point, we have everything in place to run knn(). Let’s do it for k = 1 (classification by its proximity to a single neighbor).
# For more informative reports of test object classification results, we are going to use the summary() function that can polymorphically act on its input parameter depending on its type. In our case, the input parameter to the summary() function is the output of the knn() function.
#
# •    Calculate summary() function of knn() and show the results

train <- rbind(a, b)
test <- c(4,4)
k <- 1
knn(train, test, cl, k)
summary(knn(train, test, cl, k))


#
# •    Which class does the test case belong to?

#Belongs to B class

#
# Now define
#
test <- c(3.5, 3.5)
# Visually, this test case point looks to be closer to the cluster of the A class cases (points)
#
# •    Calculate summary() function of knn() and show the results
knn(train, test, cl, k)
summary(knn(train, test, cl, k))
#
# •    Which class does the test case now belong to?
#Belongs to A class
#
# Let’s increase the number of closest neighbors that are involved in voting during the classification step.
#
#
# •    Calculate the summary using K=3 and tell which class does the test case belong to?
k <- 3
knn(train, test, cl, k)
summary(knn(train, test, cl, k))

# Belongs to B class

# Now, let’s build a matrix of test cases containing four points:
#
T1 <- c(4, 4)
T2 <- c(3,3)
T3 <- c(5,6)
T4 <- c(7,7)

t <- rbind(T1, T2, T3, T4)
plot(a, col='red', xlab = 'x', ylab = 'y', xlim = c(0,10), ylim = c(0,10))
points(b, col='blue')
points(t, col='yellow')
# How many of the points in our test batch are classified as belonging to each class?
#

test2 <- t
knn(train, test2, cl, k)
summary(knn(train, test2, cl, k))


# Create test as a two-column matrix containing the X and Y coordinates of our test points.
#
# Now run again the previous knn summary command:
#
# •    show the results