# Hippocrates Insurance+: Endowment Policy Design & Actuarial Pricing
The repository contains the product design of **Hippocrates Insurance+**, a hybrid endowment life insurance policy developed for "Life Insurance Mathematics" course.
The project tries to combine rigorous actuarial pricing and customer-centric financial product design.

## Designing the Policy
The policy was designed for clients seeking for security, market growth and lifestyle incentives.
* **Hybrid Fund Allocations:** premium split in 70% Branch 21 for security and 30% Branch 23 for potential growth
* **Innovative Wellnes Bonus:** premium that rewards policyholders for maintaing healthy physical and mental habits
* **Target Use Cases:** created for real world financial planning as parents securing child's future education

## Methodology:
* **Premium Calculation:** equivalence principle to calculate Net Single Premiums, Periodic Premiums and Commercial Tariffs (incorporating operational expense loadings)
* **Mortality and Interest Assumptions:** pricing was modeled over a 20-year term using a mixed-gender mortality table (XK, weighted 65% male / 35% female) and a 3.75% technical interest rate
* **Sensitive Analysis:** studied the financial impact of increasing the technical interest rate to 4.75%
* **Policy Value Evolution:** tracked the accumulation of mathematical reserves over the 20-year term, identifying the shift in reserve growth after the 10-year premium payment period ends
* **Profit Sharing & Business Risks:** modeled a classic profit sharing mechanism applied at year 5

## Tools:
* **Language:** R
* **Libraries:** No external dependencies required
* **Core competencies:** Actuarial Present Value, Life Annuities, Endowment Mathematics, Mathematical Reserving

## Repository Contents:
* `Hippocrates Insurance.pdf`: report of the project
* `Life Insurance.R`: R code used to calculate the various premium and results
