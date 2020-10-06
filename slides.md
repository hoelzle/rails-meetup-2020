---
marp: true
theme: uncover
class: invert
---

# Hoelzle AG
Gregor Wassmann

---

![bg](https://assets.hoelzle.ch/image/upload/ar_16:9,c_lfill,dpr_2.0,f_auto,g_custom:face,w_450/iStock-1069742886)

---

![bg](https://assets.hoelzle.ch/image/upload/ar_16:9,c_lfill,dpr_2.0,f_auto,w_450/iStock-1030386752)

---

![bg](https://assets.hoelzle.ch/image/upload/c_limit,dpr_auto,f_auto,q_auto:eco,w_1200/v1585066206/Depositphotos_43697107_original)

---

# Agenda

- Decorators vs Concerns
- Refinements

---

# Decorators

- Module + Extend + Super
- Plain Old Ruby Object (PORO)
- Class + Method Missing
- SimpleDelegator + Super + Getobj

---

# Links
- [Thoughtbot — Evaluating Alternative Decorator Implementations In Ruby](https://thoughtbot.com/blog/evaluating-alternative-decorator-implementations-in)

---

You should use…

```ruby
class Price < SimpleDelegator
end
```

---

It redefines `class`, but that may be the only drawback…

---

[github.com/hoelzle/rails-meetup-2020](https://github.com/hoelzle/rails-meetup-2020)
