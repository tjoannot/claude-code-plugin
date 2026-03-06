# Numeric Functions

Mathematical operations, cumulative calculations, window functions, and ranking capabilities.

**Covers**: Basic Math, Rounding, Cumulative Functions, Window Functions, Ranking

---

## Quick Reference

| Category       | Functions                                                               |
| -------------- | ----------------------------------------------------------------------- |
| **Basic Math** | ABS, SIGN, EXP, LN, LOG, SIN, COS, SQRT, MIN, MAX, MOD, QUOTIENT, POWER |
| **Rounding**   | ROUND, ROUNDUP, ROUNDDOWN, TRUNC, CEILING, FLOOR                        |
| **Cumulative** | CUMULATE, DECUMULATE                                                    |
| **Window**     | MOVINGSUM, MOVINGAVERAGE                                                |
| **Ranking**    | RANK, SPREAD                                                            |

---

## Basic Math Functions

| Function     | Syntax                      | Returns          | Example               |
| ------------ | --------------------------- | ---------------- | --------------------- |
| **ABS**      | `ABS(Number)`               | Absolute value   | `ABS(-5)` → 5         |
| **SIGN**     | `SIGN(Number)`              | 1, -1, or 0      | `SIGN(-10)` → -1      |
| **EXP**      | `EXP(Number)`               | e^Number         | `EXP(1)` → 2.718      |
| **LN**       | `LN(Number)`                | Natural log      | `LN(2.718)` → 1       |
| **LOG**      | `LOG(Number)`               | Log base 10      | `LOG(100)` → 2        |
| **SIN**      | `SIN(Number)`               | Sine (radians)   | `SIN(0)` → 0          |
| **COS**      | `COS(Number)`               | Cosine (radians) | `COS(0)` → 1          |
| **SQRT**     | `SQRT(Number)`              | Square root      | `SQRT(16)` → 4        |
| **MIN**      | `MIN(Value1, Value2, ...)`  | Minimum value    | `MIN(5, 10, 3)` → 3   |
| **MAX**      | `MAX(Value1, Value2, ...)`  | Maximum value    | `MAX(5, 10, 3)` → 10  |
| **MOD**      | `MOD(Number, Divisor)`      | Remainder        | `MOD(10, 3)` → 1      |
| **QUOTIENT** | `QUOTIENT(Number, Divisor)` | Integer quotient | `QUOTIENT(10, 3)` → 3 |
| **POWER**    | `POWER(Number, Power)`      | Number^Power     | `POWER(2, 3)` → 8     |

---

## Rounding Functions

| Function      | Behavior               | Syntax                         | Example                    |
| ------------- | ---------------------- | ------------------------------ | -------------------------- |
| **ROUND**     | Round to N decimals    | `ROUND(Number [, Digits])`     | `ROUND(3.14159, 2)` → 3.14 |
| **ROUNDUP**   | Round up (away from 0) | `ROUNDUP(Number [, Digits])`   | `ROUNDUP(3.14, 0)` → 4     |
| **ROUNDDOWN** | Round down (toward 0)  | `ROUNDDOWN(Number [, Digits])` | `ROUNDDOWN(3.99, 0)` → 3   |
| **TRUNC**     | Truncate decimals      | `TRUNC(Number [, Digits])`     | `TRUNC(3.99)` → 3          |
| **CEILING**   | Round up to integer    | `CEILING(Number)`              | `CEILING(3.2)` → 4         |
| **FLOOR**     | Round down to integer  | `FLOOR(Number)`                | `FLOOR(3.9)` → 3           |

**Note**: Negative or out-of-range decimals (< -14 or > 14) return BLANK.

---

## Cumulative Functions

### CUMULATE

Accumulate values over a dimension (typically Time).

**Syntax**: `CUMULATE(Number, Cumulated Dimension [, Group Dimension] [, Aggregation])`

**Examples**:

```pigment
CUMULATE('Monthly Sales', Month) // Running total by month
CUMULATE('Quantity Sold', Month, Month.Year) // Cumulative by month, reset each year
```

---

### DECUMULATE

Reverse cumulative sum (convert cumulative to periodic values).

**Syntax**: `DECUMULATE(Number, Decumulated Dimension [, Group Dimension])`

**Examples**:

```pigment
DECUMULATE('YTD Revenue', Month) // Monthly revenue from YTD
DECUMULATE(CUMULATE('Sales', Month), Month) // Returns original Sales
```

---

## Window Functions

### MOVINGSUM

Calculate sum over a moving window.

**Syntax**: `MOVINGSUM(Input, Window Size [, End Offset] [, Dimension])`

**Examples**:

```pigment
MOVINGSUM('Sales', 3) // 3-period moving sum (default over Time)
MOVINGSUM('Revenue', 12, -1) // 12-period window, offset by -1
```

---

### MOVINGAVERAGE

Calculate average over a moving window.

**Syntax**: `MOVINGAVERAGE(Input, Window Size [, End Offset] [, Dimension])`

**Examples**:

```pigment
MOVINGAVERAGE('Sales', 3) // 3-period moving average
MOVINGAVERAGE('Revenue', 12, -1) // 12-period window, offset by -1
```

---

## Ranking Functions

### RANK

Assign rank to items based on a metric value.

**Syntax**: `RANK(Source Block [, Group] [, Direction] [, Ties])`

**Examples**:

```pigment
RANK('Revenue', Product, DESC) // Rank products by revenue, highest = 1
RANK('Salary', Employee, ASC)  // Rank employees by salary, lowest = 1
```

---

### SPREAD

Distribute a value evenly across a specified number of items along a dimension.

**Syntax**: `SPREAD(Source Block, Ranking Dimension, Spread Number [, Starting Index])`

**Examples**:

```pigment
SPREAD('Quantity Sold', Month, 3) // Split value over 3 months
SPREAD(10[BY: Month."Feb 20"], Month, 6) // Spread 10 from Feb 20 over 6 months
```

---

## Common Patterns

```pigment
// Year-to-Date
CUMULATE('Monthly Revenue', Month)

// Month-over-Month Change
'Revenue' - PREVIOUSOF('Revenue', 1)

// 3-Month Moving Average
MOVINGAVERAGE('Sales', 3)

// Top 10 Products
IF(RANK('Revenue', Product, DESC) <= 10, 'Revenue', BLANK)

// Even Allocation
SPREAD('Total Budget', Department, 5)
```

---

## Critical Rules

- **CUMULATE/DECUMULATE**: Typically used on time dimensions
- **Rounding**: Negative or out-of-range decimals return BLANK
- **SPREAD**: Evenly splits value, not proportional allocation
- **Window functions**: Truncate at dimension edges
- **Performance**: Use FILTER to subset time dimension for large datasets

---

## See Also

- [functions_iterative_calculation.md](./functions_iterative_calculation.md) - PREVIOUS, PREVIOUSOF for iterative/sequential calculations
