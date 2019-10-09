# NCRA
This project was done at [NCRA](http://ncra.tifr.res.in/) under the guidance of [Dr Yogesh Wadadekar]( http://www.ncra.tifr.res.in:8081/~yogesh/)
The project was based on Machine Learning applications in astronomy.
The project intended to accuately predict photometric redshifts and comapre them with the spectroscopic counterpart.
A more datailed work on the topic was done by Dr Wadadekar and can be found [here](http://adsabs.harvard.edu/abs/2005PASP..117...79W)
The photometric data from SDSS DR 8-10 was collecetd and popular machine learning methods were employed such as
* Linear regression
* SVR(SUpport vector regresion)
* ANNs
* Tree based methods(using the "tree"package in R)
* Random Forests(performed the best giving the lowest RMSE)

All the coding was done in R and the corresponding RMSE was also compiled.
More future work is intended on this topic,I would like to use deeper surveys like Deep2 and try estimating the redshifts.


