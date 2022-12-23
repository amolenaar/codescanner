# A Quick code analysis

Say you're on a new project. The application has been built on for several years already.
The code base is big, huge maybe. Questions may arise. What is the most complex bit of this application? Who wrote it?

On out latest Innovation day those were the questions that I wanted answered. In a fast and simple way. I've read the book [Software Design X-Rays](https://pragprog.com/titles/atevol/software-design-x-rays/) by Adam Tornhill a couple of months before, but never had taken the time to practice.

The book Software Design X-Rays explains how to bring up all sorts of useful information from your version control system (e.g. Git). While we mostly focus on the latest revision of the code for things like coverage and quality, there's a whealth of information hidden in your repository. How can you discover which files have been subjet to change most? Which people worked most on certain packages (spoiler: not the one person who touched the code last!). Which files have a tendency to change together?

To get a good overview of the repository you'll have to define a time span. For long running projects it does not make sense to analyse the whole history. Going back in time 1/2 to 1 year is probably enough -- this depends somewhat on the activity on the repository.

## Quick start

Have a look at [Quick_Code_Analysis.ipynb](Quick_Code_Analysis.ipynb) and follow the instructions.

## Metrics

### Churn and complexity

Churn is a term we can use for how often a file has changed. That's where the action is. The exiting stuff is happening in the files that change most often.
With Complexity we try to get a hold of how complex the code base is. This can become quite complicated pretty fast, especially when the code base is built from multiple languages. To keep things simple we can use the file size as a proxy for complexity. Although this is not as exact as a real McCabe complexity analysis, we can at least use this without the need for extra tooling. I measured both on a few code bases (CPython, React, and Gaphor) and the metric seems to hold pretty well. 

### Top authors

Who wrote what, and who wrote most in a part (folder) of the repository.

### Change coupling

Change coupling is defined by how often files change together in a commit. If that happens often, there may be a (not so obvious) relation between the two files.
This is not uncommon. It can become a problem, though, if the files reside in a completely different folder.
