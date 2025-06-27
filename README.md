# American Options Pricing with Deep Learning (MATLAB)

This repository contains MATLAB code for pricing American-style options using deep learning techniques. The implementation is based on the master's thesis:

📄 **Master_Thesis_Khan.pdf** (located in the `/thesis` folder)

---

## 📂 Folder Structure

american-options-dl-matlab/
├── code/ # All MATLAB code files
│ ├── simulate_paths.m
│ ├── train_network.m
│ ├── evaluate_lower_bound.m
│ ├── lower_bound_validity.m
│ └── (other .m files)
├── thesis/ # Final thesis PDF
│ └── Master_Thesis_Khan.pdf
├── README.md
├── LICENSE
└── requirements.txt


---

## 📌 Key Files

- `simulate_paths.m`: Simulates asset price paths using a stochastic process (e.g., Geometric Brownian Motion)
- `train_network.m`: Trains a neural network to approximate the option continuation value
- `evaluate_lower_bound.m`: Computes the lower bound estimate of the American option price
- `lower_bound_validity.m`: Verifies the accuracy and validity of the lower bound approximation

---

## ⚙️ Requirements

See [`requirements.txt`](requirements.txt)

- MATLAB R2023a or later
- Deep Learning Toolbox
- Statistics and Machine Learning Toolbox

---

## 📄 Thesis

This repository accompanies my master’s thesis:

**Pricing and Hedging American-Style Options with Deep Learning: Algorithmic Implementation**  
[🔗 Available via Uppsala University Repository](https://uu.diva-portal.org/smash/record.jsf?dswid=1189&pid=diva2%3A1742682&c=1&searchType=SIMPLE&language=en&query=Mohammed+Moniruzzaman+khan&af=%5B%5D&aq=%5B%5B%5D%5D&aq2=%5B%5B%5D%5D&aqe=%5B%5D&noOfRows=50&sortOrder=author_sort_asc&sortOrder2=title_sort_asc&onlyFullText=false&sf=undergraduate)  
U.U.D.M. Project Report 2023:1, Uppsala University

## 🧠 Thesis Summary

The thesis proposes a deep learning approach for solving optimal stopping problems in financial mathematics. American-style options are priced by simulating asset price paths and using a deep neural network to approximate continuation values. The algorithm provides both a price estimate and a verified lower bound.

---

## 🪪 License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE) for details.



