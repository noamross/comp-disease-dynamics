% Comparative Dynamics
% Noam Ross
% 14-08-25 10:10:34 



Here I examine the comparative dynamics of age classes in 2-age-class models
of both $SI$, $SIV$, and macroparasite-style dynamic models.

The following parameters are identical between models:

 - fecundity $(f)$
 - transition rate $(g)$
 - carrying capacity $(K)$
 
The models are also parameterized to have identical *apparent mortality* rates
at equilibrium.  That is the aggregate mortality rates of all infection classes
are the same. 




```
## Warning: cannot open file 'R/process_sodp.R': No such file or directory
```

```
## Error: cannot open the connection
```

```
## Warning: cannot open file 'R/run_sodp.R': No such file or directory
```

```
## Error: cannot open the connection
```




```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk progplot](figure/progplot1.png) 

```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk progplot](figure/progplot2.png) 



```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk base_comparison](figure/base_comparison.png) 


```
## [1] 0.2206
## [1] 0.3491
## [1] 0.1353
## [1] 0.2031
## [1] 0.2009
## [1] 0.2
## [1] 0.2
## [1] 0.2
## [1] 0.2
## [1] 0.2
## [1] 0.2
```

```
## [1] 0.2461
## [1] 0.3804
## [1] 0.1526
## [1] 0.2027
## [1] 0.2026
## [1] 0.1999
## [1] 0.1832
## [1] 0.2
## [1] 0.2
## [1] 0.2
## [1] 0.2
## [1] 0.2
## [1] 0.2
```


```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk equiv_equilib](figure/equiv_equilib.png) 


```
##    derivs   derivs2 
## 0.0027725 0.0007671 
##    derivs   derivs2 
## 0.0025745 0.0006592 
##   derivs  derivs2 
## 0.003258 0.001062 
##    derivs   derivs2 
## 0.0020893 0.0004317 
##    derivs   derivs2 
## 0.0029656 0.0008783 
##    derivs   derivs2 
## 0.0023814 0.0005633 
##    derivs   derivs2 
## 0.0028195 0.0007931 
##    derivs   derivs2 
## 0.0030175 0.0009108 
##    derivs   derivs2 
## 0.0026853 0.0007184 
##    derivs   derivs2 
## 0.0026382 0.0006937 
##    derivs   derivs2 
## 0.0027742 0.0007676 
##    derivs   derivs2 
## 0.0028614 0.0008179 
##    derivs   derivs2 
## 0.0027293 0.0007427 
##    derivs   derivs2 
## 0.0028174 0.0007925 
##   derivs  derivs2 
## 0.002751 0.000755 
##    derivs   derivs2 
## 0.0027496 0.0007545 
##    derivs   derivs2 
## 0.0027558 0.0007578 
##    derivs   derivs2 
## 0.0027284 0.0007424 
##    derivs   derivs2 
## 0.0027615 0.0007609 
##    derivs   derivs2 
## 0.0027395 0.0007486 
##    derivs   derivs2 
## 0.0027560 0.0007578 
##    derivs   derivs2 
## 0.0027450 0.0007517 
##    derivs   derivs2 
## 0.0027532 0.0007563 
##    derivs   derivs2 
## 0.0027549 0.0007568 
##    derivs   derivs2 
## 0.0027536 0.0007562 
##    derivs   derivs2 
## 0.0027517 0.0007549 
##    derivs   derivs2 
## 0.0027509 0.0007542 
##    derivs   derivs2 
## 0.0027540 0.0007561 
##    derivs   derivs2 
## 0.0027553 0.0007567 
##    derivs   derivs2 
## 0.0027521 0.0007548 
##    derivs   derivs2 
## 0.0027513 0.0007541 
##   derivs  derivs2 
## 0.002754 0.000756 
##    derivs   derivs2 
## 0.0027557 0.0007566 
##    derivs   derivs2 
## 0.0027525 0.0007547 
##   derivs  derivs2 
## 0.002752 0.000754 
##    derivs   derivs2 
## 0.0027547 0.0007559 
##    derivs   derivs2 
## 0.0027561 0.0007565 
##    derivs   derivs2 
## 0.0027528 0.0007546 
##    derivs   derivs2 
## 0.0027521 0.0007539 
##    derivs   derivs2 
## 0.0027551 0.0007558 
##    derivs   derivs2 
## 0.0027565 0.0007564 
##    derivs   derivs2 
## 0.0027532 0.0007545 
##    derivs   derivs2 
## 0.0027525 0.0007538 
##    derivs   derivs2 
## 0.0027555 0.0007557 
##    derivs   derivs2 
## 0.0027568 0.0007563 
##    derivs   derivs2 
## 0.0027536 0.0007544 
##    derivs   derivs2 
## 0.0027528 0.0007537 
##    derivs   derivs2 
## 0.0027559 0.0007556 
##    derivs   derivs2 
## 0.0027572 0.0007562 
##    derivs   derivs2 
## 0.0027540 0.0007543 
##    derivs   derivs2 
## 0.0027532 0.0007536 
##    derivs   derivs2 
## 0.0027563 0.0007555 
##    derivs   derivs2 
## 0.0027576 0.0007561 
##    derivs   derivs2 
## 0.0027544 0.0007542 
##    derivs   derivs2 
## 0.0027536 0.0007535 
##    derivs   derivs2 
## 0.0027566 0.0007554 
##   derivs  derivs2 
## 0.002758 0.000756 
##    derivs   derivs2 
## 0.0027547 0.0007541 
##    derivs   derivs2 
## 0.0027540 0.0007534 
##    derivs   derivs2 
## 0.0027570 0.0007553 
##    derivs   derivs2 
## 0.0027583 0.0007558 
##   derivs  derivs2 
## 0.002755 0.000754 
##    derivs   derivs2 
## 0.0027555 0.0007543 
##    derivs   derivs2 
## 0.0027578 0.0007555 
##    derivs   derivs2 
## 0.0027593 0.0007563 
##    derivs   derivs2 
## 0.0027563 0.0007546 
##    derivs   derivs2 
## 0.0027559 0.0007542 
##    derivs   derivs2 
## 0.0027582 0.0007554 
##   derivs  derivs2 
## 0.002759 0.000756 
##    derivs   derivs2 
## 0.0027563 0.0007541 
##    derivs   derivs2 
## 0.0027555 0.0007533 
##    derivs   derivs2 
## 0.0027585 0.0007553 
##    derivs   derivs2 
## 0.0027599 0.0007558 
##   derivs  derivs2 
## 0.002757 0.000754 
##    derivs   derivs2 
## 0.0027559 0.0007532 
##    derivs   derivs2 
## 0.0027589 0.0007552 
##    derivs   derivs2 
## 0.0027602 0.0007557 
##    derivs   derivs2 
## 0.0027570 0.0007538 
##    derivs   derivs2 
## 0.0027563 0.0007531 
##   derivs  derivs2 
## 0.002759 0.000755 
##    derivs   derivs2 
## 0.0027606 0.0007556 
##    derivs   derivs2 
## 0.0027574 0.0007537 
##    derivs   derivs2 
## 0.0027578 0.0007541 
##    derivs   derivs2 
## 0.0027601 0.0007553 
##   derivs  derivs2 
## 0.002762 0.000756 
##    derivs   derivs2 
## 0.0027585 0.0007543 
##    derivs   derivs2 
## 0.0027582 0.0007539 
##    derivs   derivs2 
## 0.0027604 0.0007551 
##    derivs   derivs2 
## 0.0027618 0.0007557 
##    derivs   derivs2 
## 0.0027585 0.0007538 
##   derivs  derivs2 
## 0.002758 0.000753 
##   derivs  derivs2 
## 0.002761 0.000755 
##    derivs   derivs2 
## 0.0027621 0.0007555 
##    derivs   derivs2 
## 0.0027589 0.0007536 
##    derivs   derivs2 
## 0.0027582 0.0007529 
##    derivs   derivs2 
## 0.0027612 0.0007548 
##    derivs   derivs2 
## 0.0027625 0.0007554 
##    derivs   derivs2 
## 0.0027593 0.0007535 
##    derivs   derivs2 
## 0.0027597 0.0007539 
##    derivs   derivs2 
## 0.0027620 0.0007551 
##    derivs   derivs2 
## 0.0027635 0.0007558 
##    derivs   derivs2 
## 0.0027604 0.0007541 
##    derivs   derivs2 
## 0.0027601 0.0007537 
##    derivs   derivs2 
## 0.0027623 0.0007549 
##    derivs   derivs2 
## 0.0027637 0.0007555 
##    derivs   derivs2 
## 0.0027604 0.0007536 
##    derivs   derivs2 
## 0.0027597 0.0007528 
##    derivs   derivs2 
## 0.0027627 0.0007548 
##    derivs   derivs2 
## 0.0027640 0.0007553 
##    derivs   derivs2 
## 0.0027608 0.0007534 
##    derivs   derivs2 
## 0.0027601 0.0007526 
##    derivs   derivs2 
## 0.0027631 0.0007546 
##    derivs   derivs2 
## 0.0027644 0.0007551 
##    derivs   derivs2 
## 0.0027612 0.0007532 
##    derivs   derivs2 
## 0.0027616 0.0007536 
##    derivs   derivs2 
## 0.0027639 0.0007548 
##    derivs   derivs2 
## 0.0027654 0.0007556 
##    derivs   derivs2 
## 0.0027623 0.0007539 
##    derivs   derivs2 
## 0.0027620 0.0007535 
##    derivs   derivs2 
## 0.0027646 0.0007551 
##    derivs   derivs2 
## 0.0027639 0.0007547 
##    derivs   derivs2 
## 0.0027623 0.0007537 
##    derivs   derivs2 
## 0.0027616 0.0007532 
##    derivs   derivs2 
## 0.0027608 0.0007529 
##    derivs   derivs2 
## 0.0027631 0.0007542 
##    derivs   derivs2 
## 0.0027631 0.0007541 
##    derivs   derivs2 
## 0.0027635 0.0007542 
##    derivs   derivs2 
## 0.0027627 0.0007537 
##    derivs   derivs2 
## 0.0027625 0.0007534 
##   derivs  derivs2 
## 0.002764 0.000754 
##    derivs   derivs2 
## 0.0027643 0.0007541 
##    derivs   derivs2 
## 0.0027634 0.0007533 
##    derivs   derivs2 
## 0.0027634 0.0007535 
##    derivs   derivs2 
## 0.0027652 0.0007539 
##    derivs   derivs2 
## 0.0027665 0.0007541 
##    derivs   derivs2 
## 0.0027675 0.0007549 
##    derivs   derivs2 
## 0.0027664 0.0007545 
##    derivs   derivs2 
## 0.0027686 0.0007545 
##    derivs   derivs2 
## 0.0027708 0.0007547 
##    derivs   derivs2 
## 0.0027708 0.0007543 
##    derivs   derivs2 
## 0.0027730 0.0007542 
##    derivs   derivs2 
## 0.0027773 0.0007546 
##    derivs   derivs2 
## 0.0027692 0.0007543 
##    derivs   derivs2 
## 0.0027715 0.0007537 
##    derivs   derivs2 
## 0.0027718 0.0007532 
##   derivs  derivs2 
## 0.002776 0.000753 
##    derivs   derivs2 
## 0.0027741 0.0007533 
##    derivs   derivs2 
## 0.0027728 0.0007524 
##    derivs   derivs2 
## 0.0027729 0.0007528 
##    derivs   derivs2 
## 0.0027707 0.0007527 
##    derivs   derivs2 
## 0.0027715 0.0007529 
##    derivs   derivs2 
## 0.0027726 0.0007525 
##   derivs  derivs2 
## 0.002772 0.000753 
##   derivs  derivs2 
## 0.002773 0.000753 
##   derivs  derivs2 
## 0.002773 0.000753 
##    derivs   derivs2 
## 0.0027738 0.0007528 
##   derivs  derivs2 
## 0.002772 0.000753 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##    derivs   derivs2 
## 0.0027722 0.0007528 
##   derivs  derivs2 
## 0.002772 0.000753 
##    derivs   derivs2 
## 0.0027727 0.0007529 
##    derivs   derivs2 
## 0.0027726 0.0007528 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##   derivs  derivs2 
## 0.002773 0.000753 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##   derivs  derivs2 
## 0.002772 0.000753 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027726 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529
```

```
##    derivs   derivs2 
## 0.0027725 0.0007529 
##   derivs  derivs2 
## 0.002409 0.000560 
##   derivs  derivs2 
## 0.003664 0.001330 
##   derivs  derivs2 
## 0.001517 0.000210 
##    derivs   derivs2 
## 0.0031274 0.0009622 
##    derivs   derivs2 
## 0.0020536 0.0004024 
##    derivs   derivs2 
## 0.0028590 0.0008004 
##   derivs  derivs2 
## 0.003223 0.001026 
##   derivs  derivs2 
## 0.002612 0.000664 
##    derivs   derivs2 
## 0.0030193 0.0008973 
##    derivs   derivs2 
## 0.0027139 0.0007192 
##    derivs   derivs2 
## 0.0026275 0.0006743 
##    derivs   derivs2 
## 0.0028011 0.0007678 
##    derivs   derivs2 
## 0.0028597 0.0008026 
##    derivs   derivs2 
## 0.0027504 0.0007396 
##   derivs  derivs2 
## 0.002722 0.000725 
##   derivs  derivs2 
## 0.002781 0.000757 
##    derivs   derivs2 
## 0.0028034 0.0007704 
##    derivs   derivs2 
## 0.0027636 0.0007473 
##    derivs   derivs2 
## 0.0027901 0.0007627 
##    derivs   derivs2 
## 0.0027702 0.0007511 
##   derivs  derivs2 
## 0.002761 0.000747 
##    derivs   derivs2 
## 0.0027763 0.0007545 
##    derivs   derivs2 
## 0.0027664 0.0007495 
##    derivs   derivs2 
## 0.0027738 0.0007533 
##    derivs   derivs2 
## 0.0027761 0.0007551 
##    derivs   derivs2 
## 0.0027717 0.0007521 
##    derivs   derivs2 
## 0.0027746 0.0007541 
##    derivs   derivs2 
## 0.0027724 0.0007526 
##    derivs   derivs2 
## 0.0027711 0.0007522 
##   derivs  derivs2 
## 0.002773 0.000753 
##    derivs   derivs2 
## 0.0027732 0.0007533 
##    derivs   derivs2 
## 0.0027726 0.0007528 
##    derivs   derivs2 
## 0.0027720 0.0007527 
##    derivs   derivs2 
## 0.0027729 0.0007529 
##    derivs   derivs2 
## 0.0027727 0.0007531 
##    derivs   derivs2 
## 0.0027727 0.0007528 
##    derivs   derivs2 
## 0.0027723 0.0007528 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##    derivs   derivs2 
## 0.0027723 0.0007529 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##   derivs  derivs2 
## 0.002772 0.000753 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##    derivs   derivs2 
## 0.0027726 0.0007529 
##    derivs   derivs2 
## 0.0027724 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529 
##    derivs   derivs2 
## 0.0027725 0.0007529
```


```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk init_derivs](figure/init_derivs.png) 



```
## [1] 11.31
## [1] 6.869
## [1] 5.529
## [1] 7.839
## [1] 8.167
## [1] 9.136
## [1] 8.714
## [1] 8.697
## [1] 8.722
## [1] 8.724
## [1] 8.724
## [1] 8.724
## [1] 8.724
## [1] 8.724
## [1] 8.724
```

```
## [1] 11.3
## [1] 6.867
## [1] 5.527
## [1] 7.841
## [1] 8.167
## [1] 9.135
## [1] 8.714
## [1] 8.697
## [1] 8.722
## [1] 8.724
## [1] 8.724
## [1] 8.724
## [1] 8.724
## [1] 8.724
## [1] 8.724
```


```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk time_to_I10](figure/time_to_I10.png) 


```
## [1]  8.546 13.909
## [1]  9.258 15.361
## [1]  7.241 11.633
## [1] 11.51 19.73
## [1]  7.98 12.94
## [1] 10.03 16.76
## [1]  8.409 13.716
## [1]  9.424 15.597
## [1]  8.642 14.141
## [1]  8.019 12.920
## [1]  8.913 14.658
## [1]  9.018 14.924
## [1]  8.895 14.653
## [1]  9.183 15.213
## [1]  8.771 14.393
## [1]  9.041 14.929
## [1]  8.837 14.523
## [1]  8.819 14.518
## [1]  8.773 14.450
## [1]  8.762 14.391
## [1]  8.861 14.587
## [1]  8.843 14.582
## [1]  8.847 14.612
## [1]  8.804 14.544
## [1]  8.776 14.523
## [1]  8.804 14.620
## [1]  8.796 14.675
## [1]  8.727 14.588
## [1]  8.669 14.584
## [1]  8.747 14.753
## [1]  8.734 14.890
## [1]  8.679 14.668
## [1]  8.708 14.668
## [1]  8.728 14.844
## [1]  8.727 14.648
## [1]  8.728 14.775
## [1]  8.727 14.679
## [1]  8.688 14.595
## [1]  8.732 14.713
## [1]  8.752 14.724
## [1]  8.719 14.682
## [1]  8.724 14.716
## [1]  8.722 14.735
## [1]  8.737 14.747
## [1]  8.723 14.698
## [1]  8.715 14.701
## [1]  8.728 14.710
## [1]  8.728 14.728
## [1]  8.725 14.705
## [1]  8.729 14.699
## [1]  8.725 14.712
## [1]  8.722 14.707
## [1]  8.723 14.708
## [1]  8.723 14.702
## [1]  8.724 14.709
## [1]  8.723 14.712
## [1]  8.724 14.707
## [1]  8.723 14.710
## [1]  8.724 14.708
## [1]  8.723 14.707
## [1]  8.724 14.709
## [1]  8.723 14.709
## [1]  8.723 14.709
## [1]  8.724 14.709
## [1]  8.724 14.708
## [1]  8.723 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.709
## [1]  8.724 14.708
## [1]  8.723 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
```

```
## [1]  8.721 14.657
## [1]  9.712 17.032
## [1]  7.046 11.529
```

```
## Warning: no non-missing arguments to min; returning Inf
```

```
## [1] 13.22 25.00
## [1]  7.976 13.286
## [1]  7.298 11.881
## [1]  8.968 15.303
## [1]  9.922 17.185
## [1]  8.387 14.075
## [1]  9.351 15.995
## [1]  8.609 14.508
## [1]  8.381 13.941
## [1]  8.814 14.931
## [1]  8.931 15.088
## [1]  8.687 14.649
## [1]  8.597 14.388
## [1]  8.758 14.790
## [1]  8.65 14.52
## [1]  8.731 14.721
## [1]  8.765 14.730
## [1]  8.745 14.709
## [1]  8.756 14.774
## [1]  8.729 14.686
## [1]  8.715 14.698
## [1]  8.723 14.701
## [1]  8.724 14.736
## [1]  8.728 14.698
## [1]  8.72 14.68
## [1]  8.728 14.710
## [1]  8.723 14.713
## [1]  8.72 14.72
## [1]  8.728 14.722
## [1]  8.724 14.706
## [1]  8.719 14.708
## [1]  8.726 14.710
## [1]  8.727 14.703
## [1]  8.724 14.710
## [1]  8.722 14.706
## [1]  8.723 14.707
## [1]  8.723 14.712
## [1]  8.724 14.707
## [1]  8.723 14.704
## [1]  8.724 14.709
## [1]  8.724 14.709
## [1]  8.724 14.708
## [1]  8.724 14.710
## [1]  8.724 14.708
## [1]  8.724 14.709
## [1]  8.724 14.708
## [1]  8.723 14.709
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.709
## [1]  8.724 14.709
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.709
## [1]  8.724 14.709
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
## [1]  8.724 14.708
```


```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk time_to_I1030](figure/time_to_I1030.png) 



```
## [1] 8.5458 0.5097
## [1] 9.2581 0.4648
## [1] 7.2408 0.5465
## [1] 11.5087  0.4176
## [1] 7.9798 0.5179
## [1] 7.4464 0.5626
## [1] 8.7265 0.4894
## [1] 9.4080 0.4796
## [1] 8.2945 0.5088
## [1] 8.1314 0.5294
## [1] 8.2723 0.5193
## [1] 8.5222 0.5204
## [1] 8.6410 0.5265
## [1] 8.9397 0.5164
## [1] 8.7629 0.5172
## [1] 8.8633 0.5347
## [1] 8.7816 0.5282
## [1] 8.6592 0.5377
## [1] 8.7367 0.5222
## [1] 8.8805 0.5239
## [1] 8.6996 0.5259
## [1] 8.656 0.520
## [1] 8.7498 0.5261
## [1] 8.7126 0.5298
## [1] 8.7307 0.5241
## [1] 8.6808 0.5239
## [1] 8.7324 0.5255
## [1] 8.7637 0.5238
## [1] 8.7156 0.5253
## [1] 8.7173 0.5268
## [1] 8.7273 0.5248
## [1] 8.7206 0.5261
## [1] 8.7256 0.5251
## [1] 8.7088 0.5249
## [1] 8.7265 0.5254
## [1] 8.7366 0.5252
## [1] 8.7208 0.5253
## [1] 8.7217 0.5256
## [1] 8.7227 0.5255
## [1] 8.7283 0.5255
## [1] 8.7227 0.5254
## [1] 8.7189 0.5254
## [1] 8.7246 0.5254
## [1] 8.7246 0.5253
## [1] 8.7231 0.5254
## [1] 8.7250 0.5255
## [1] 8.7233 0.5254
## [1] 8.7218 0.5254
## [1] 8.7239 0.5254
## [1] 8.7240 0.5254
## [1] 8.7238 0.5254
## [1] 8.7232 0.5254
## [1] 8.7237 0.5254
## [1] 8.7243 0.5254
## [1] 8.7235 0.5254
## [1] 8.7236 0.5254
## [1] 8.7236 0.5254
## [1] 8.7233 0.5254
## [1] 8.7237 0.5254
## [1] 8.7238 0.5254
## [1] 8.7236 0.5254
## [1] 8.7237 0.5254
## [1] 8.7236 0.5254
## [1] 8.7237 0.5254
## [1] 8.7236 0.5254
## [1] 8.7236 0.5254
## [1] 8.7237 0.5254
```

```
## [1] 8.721 0.519
## [1] 9.4303 0.4754
## [1] 7.4126 0.5528
## [1] 11.6578  0.4306
## [1] 8.1542 0.5261
## [1] 7.620 0.569
## [1] 8.9007 0.4991
## [1] 9.5799 0.4904
## [1] 8.4693 0.5177
## [1] 8.3063 0.5377
## [1] 8.447 0.528
## [1] 8.6973 0.5296
## [1] 8.8161 0.5358
## [1] 8.9873 0.5203
## [1] 8.8459 0.5223
## [1] 8.5761 0.5262
## [1] 8.7769 0.5233
## [1] 8.7533 0.5341
## [1] 8.7287 0.5227
## [1] 8.8089 0.5165
## [1] 8.7249 0.5263
## [1] 8.6773 0.5257
## [1] 8.7020 0.5251
## [1] 8.6982 0.5287
## [1] 8.7211 0.5242
## [1] 8.7441 0.5254
## [1] 8.7335 0.5253
## [1] 8.7374 0.5274
## [1] 8.725 0.525
## [1] 8.734 0.524
## [1] 8.7271 0.5257
## [1] 8.7187 0.5254
## [1] 8.7114 0.5254
## [1] 8.7207 0.5261
## [1] 8.7240 0.5253
## [1] 8.7157 0.5249
## [1] 8.7243 0.5255
## [1] 8.7295 0.5254
## [1] 8.7214 0.5254
## [1] 8.7212 0.5251
## [1] 8.7235 0.5254
## [1] 8.7261 0.5253
## [1] 8.7226 0.5254
## [1] 8.7221 0.5255
## [1] 8.7235 0.5253
## [1] 8.7244 0.5254
## [1] 8.7240 0.5254
## [1] 8.7239 0.5255
## [1] 8.7236 0.5254
## [1] 8.7241 0.5253
## [1] 8.7237 0.5254
## [1] 8.7233 0.5254
## [1] 8.7238 0.5254
## [1] 8.7238 0.5253
## [1] 8.7237 0.5254
## [1] 8.7239 0.5254
## [1] 8.7237 0.5254
## [1] 8.7236 0.5254
## [1] 8.7236 0.5254
## [1] 8.7236 0.5254
## [1] 8.7237 0.5254
## [1] 8.7236 0.5254
## [1] 8.7237 0.5254
## [1] 8.7236 0.5254
## [1] 8.7237 0.5254
## [1] 8.7236 0.5254
## [1] 8.7237 0.5254
## [1] 8.7237 0.5254
## [1] 8.7236 0.5254
## [1] 8.7236 0.5254
## [1] 8.7236 0.5254
```


```
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
## Warning: font family 'Lato' not found in PostScript font database
```

![plot of chunk time_to_I10_equib](figure/time_to_I10_equib.png) 

Currently matching model by equilibrium mortality.  Next, match the models by
initial growth behavior.  That is, growth rate at time zero, or R0.   How do
models behave comparatively if they have initial growth rate of infected
individuals that is the same?  What if we peg both initial rate and final
equilibrium mortality rate, but free both $\alpha$ and $\lambda$ to vary
independently?  How will models behave differently?

Need too calculate this rate for the given initial number of infected individuals
Model may need to be modified to only have initial infected individuals be of
lowest disease class, not all disease classes.

At initiation, when all individuals are either susceptible or only have one
infection, the growth in infected individuals is

$$\lambda_{I_1} - d - \alpha$$


Note that the 2nd derivative of $V$ is very small no matter when $I$ is small at $V=H=0$:

$$\frac{d^2V}{dt^2} = - I^{3} \lambda^{2} + I^{2} \left(2 S \lambda^{2} - 4 \alpha \lambda - 3 d \lambda\right)$$
