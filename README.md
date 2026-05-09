# American Options Pricing with Deep Learning (MATLAB)
This repository implements a deep learning framework for pricing American-style options using Monte Carlo simulation and neural network-based approximation of continuation values. The project accompanies the master’s thesis:

“Pricing and Hedging American-Style Options with Deep Learning: Algorithmic Implementation” (Uppsala University).

---


## PROJECT SUMMARY

American options involve early exercise flexibility, leading to a high-dimensional optimal stopping problem with no closed-form solution. This project addresses this challenge by combining stochastic simulation and machine learning to approximate optimal exercise strategies.

The framework simulates asset price dynamics under a Geometric Brownian Motion (GBM) model using Monte Carlo methods and learns optimal stopping decisions through neural network approximation.

---

## METHODOLOGY

### Monte Carlo Simulation
- Simulates multiple asset price paths under risk-neutral GBM dynamics  
- Generates training data for stochastic decision learning  

### Neural Network Approximation
- Deep neural network trained to estimate continuation values  
- Learns conditional expectation of future payoffs from simulated paths  

### Optimal Stopping Policy
- Compares immediate exercise value vs continuation value  
- Constructs optimal stopping rule for American option pricing  

---

## KEY RESULTS

- Stable pricing estimates for American options using learned stopping policy  
- Consistent lower-bound pricing aligned with optimal stopping theory  
- Demonstrates convergence behavior across simulated asset paths  
- Provides a scalable alternative to classical regression-based Longstaff–Schwartz methods  

---

## REPOSITORY STRUCTURE

code/  
- simulate_paths.m  
- train_network.m  
- evaluate_lower_bound.m  
- lower_bound_validity.m  

thesis/  
- Master_Thesis_Khan.pdf  

README.md  
LICENSE  
requirements.txt  

---

## REQUIREMENTS

- MATLAB R2023a or later  
- Deep Learning Toolbox  
- Statistics and Machine Learning Toolbox  

---

## RESEARCH CONTRIBUTION

This work demonstrates how deep neural networks can approximate continuation values in optimal stopping problems for American options. Unlike classical regression-based Longstaff–Schwartz methods, this approach enables flexible nonlinear function approximation, making it suitable for high-dimensional stochastic financial systems.

The framework integrates Monte Carlo simulation, stochastic calculus, and deep learning into a unified computational pipeline for option pricing.

---

## SKILLS

Quantitative Finance • Stochastic Processes • Monte Carlo Simulation • Optimal Stopping Theory • Geometric Brownian Motion • Deep Learning • Neural Networks • MATLAB Programming • Computational Finance

---

## Connect with Me
 Github : https://github.com/MoMkhan1/american-options-dl-matlab
🔗 [LinkedIn – Mohammed Moniruzzaman Khan](https://www.linkedin.com/in/mohammed-moniruzzaman-khan)





