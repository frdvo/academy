# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise
```
git checkout -b bugFix
git commit -m "Fix bugs"
git checkout master
git commit -m "Commit master after bugFix to produce a fork"
git merge bugFix

```

2. Commands typed to solve the "Rebasing" exercise
```
git checkout -b bugFix
git commit -m "Fix bugs"
git checkout master
git commit
git checkout bugFix
git rebase master

```

3. Commands typed to solve the "Revert and reset" exercise
```
git reset master
git checkout pushed
git revert pushed

```


***
Answer for exercise [c01-git01](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git01/README.md)
