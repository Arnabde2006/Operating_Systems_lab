# Assignment 2 — File Permissions, Sorting & Text Filtering

**Institute of Engineering and Management**
**Operating Systems Lab (BCACC 392)**

**Name:** Arnab De | **Roll No.:** 63 | **Section:** A | **Year:** 2nd

---

## 1. Create a file with subject records in table format (two semesters, theory subjects only); display the contents

**Commands:**
```bash
gnome-text-editor table1
# (type the table below in the editor window, then save)
cat table1
```
**About:** `gnome-text-editor` opens the GNOME graphical text editor, used here to create and type the table into the file `table1`. `cat` is then used back in the terminal to display the full contents of the file that was created.

**Output:**
```
1 | BCACC101 | C-programming
1 | BCACC102 | Digital Electronics
1 | BCACC103 | CAT
2 | BCACC201 | C++ using OOPs
2 | BCACC202 | DSA
2 | BCACC203 | Computer Architecture
3 | BCACC301 | Design and Analysis of Algorithms
3 | BCACC302 | Operating System
3 | BCACC303 | AI using Python
```

---

## 2. Find out different existing permissions of files

**Command:**
```bash
ls -l subtable
```
**About:** `ls -l` lists a file (or files) in long format, which shows the existing permission string (read/write/execute for owner, group, and others) along with owner, size, and modification date.

**Output:**
```
-rw-r--r-- 1 student student 281 Aug 11 12:36 subtable
```

---

## 3. Try and change existing permissions of a file

**Commands:**
```bash
chmod u-x subtable
ls -l subtable

chmod u+x subtable
ls -l subtable

chmod g+w subtable
ls -l subtable

chmod g-w subtable
ls -l subtable
```
**About:** `chmod` changes file permissions. `u`/`g`/`o` refer to user (owner)/group/others, and `+`/`-` adds or removes a permission (`r` = read, `w` = write, `x` = execute). Each change is verified immediately with `ls -l`.

**Output (starting from `-rw-r--r--`):**
```
chmod u-x  →  -rw-r--r--   (no change — owner had no execute bit to remove)
chmod u+x  →  -rwxr--r--   (owner gains execute)
chmod g+w  →  -rwxrw-r--   (group gains write)
chmod g-w  →  -rwxr--r--   (group loses write, back to original group perms)
```
> Note: a couple of these permission strings were hard to make out precisely in the handwritten notebook — the sequence above follows standard `chmod` behaviour starting from the `-rw-r--r--` shown in Q2. Worth double-checking against your notebook.

---

## 4. List all the files with their detail information

**Command:**
```bash
ls -l
```
**About:** `ls -l` lists every file/directory in the current location in long format, showing permissions, number of links, owner, group, size (bytes), last modified date/time, and name.

**Output:**
```
total 120
drwxrwxr-x 2 student student  4096 Jun 12 16:59  abc
-rw-rw-r-- 1 student student    86 Aug 14 15:50  add.c
-rwxrwxr-x 1 student student 16008 Aug 14 15:53  a.out
drwxrwxr-x 2 student student  4096 Aug 10 12:14  Arhana
drwxrwxr-x 2 student student  4096 Aug 17 10:56  ArnabDe
-rw-rw-r-- 1 student student  1783 Apr  1 15:27  clock.c
-rw-rw-r-- 1 student student    75 Apr  2 14:01  hash.txt
-rw------- 1 student student    70 Aug 14 15:44  gnl.c
-rwxr--r-- 1 student student   281 Aug 11 12:36  subtable
-rw-rw-r-- 1 student student   162 Aug 12 12:03  table1
```
> A few filenames (`Arhana`, `ArnabDe`, `clock.c`, `gnl.c`) were hard to read exactly in the handwriting — verify these against your notebook/terminal.

---

## 5. Create a file with Emp ID, Name, Department, Designation, Salary for 10 employees (with duplicate records, same names in different letter cases)

**Commands:**
```bash
gnome-text-editor table
# (type the 11 records below)
cat table
```
**About:** `gnome-text-editor` is used to create the employee record file `table`, with Emp-IDs given different leading digits (1 and 2) so the same file can be used for filtering later. One record (`1007 RAJESH DAS`) is deliberately duplicated in a different letter case to demonstrate case-insensitive matching.

**Output:**
```
1001 | Priya Sharma  | Marketing       | Marketing Executive  | 74000
1002 | Amit Verma    | Sales           | Sales Executive       | 122000
1003 | Rajesh Sharma | Human Resource  | HR Coordinator        | 74000
1004 | Sneha Nair    | Sales           | Sales Executive       | 119000
2005 | Sneha Nair    | Finance         | Financial Analyst     | 104000
1006 | Neha Joshi    | Human Resource  | HR Coordinator        | 137000
1007 | Rajesh Das    | Marketing       | Marketing Executive   | 73000
2008 | Ananya Verma  | Human Resource  | HR Manager            | 58000
1009 | Ananya Das    | Sales           | Account Manager       | 51000
2021 | Kiran Nair    | Human Resource  | HR Manager            | 55000
1007 | RAJESH DAS    | MARKETING       | MARKETING EXECUTIVE   | 73000
```

### 5a. Sort the record according to Salary field, in reverse order

**Command:**
```bash
sort -t"|" -k5 -r table
```
**About:** `sort -t"|"` sets `|` as the field separator, `-k5` sorts on the 5th field (Salary), and `-r` reverses the order (highest first). Note: without an additional `-n` flag, `sort` compares the Salary as **text**, not as a number — which is why the values below are not in perfect numeric order.

**Output:**
```
1006 | Neha Joshi    | Human Resource  | HR Coordinator        | 137000
1002 | Amit Verma    | Sales           | Sales Executive       | 122000
1004 | Sneha Nair    | Sales           | Sales Executive       | 119000
2005 | Sneha Nair    | Finance         | Financial Analyst     | 104000
1003 | Rajesh Sharma | Human Resource  | HR Coordinator        | 74000
1001 | Priya Sharma  | Marketing       | Marketing Executive   | 74000
1007 | Rajesh Das    | Marketing       | Marketing Executive   | 73000
1007 | RAJESH DAS    | MARKETING       | MARKETING EXECUTIVE   | 73000
2008 | Ananya Verma  | Human Resource  | HR Manager            | 58000
2021 | Kiran Nair    | Human Resource  | HR Manager            | 55000
1009 | Ananya Das    | Sales           | Account Manager       | 51000
```

### 5b. Select the non-repeated lines

**Command:**
```bash
cut -d"|" -f1,2,3,4,5 table | sort -f | uniq -i -u
```
**About:** `cut` selects the required fields. `sort -f` folds letter case before ordering, so the two differently-cased "1007" lines land right next to each other. `uniq -i -u` then compares those adjacent lines case-insensitively and prints only the ones that occur **exactly once**.

**Output:**
```
1001 | Priya Sharma  | Marketing       | Marketing Executive  | 74000
1002 | Amit Verma    | Sales           | Sales Executive       | 122000
1003 | Rajesh Sharma | Human Resource  | HR Coordinator        | 74000
1004 | Sneha Nair    | Sales           | Sales Executive       | 119000
1006 | Neha Joshi    | Human Resource  | HR Coordinator        | 137000
1009 | Ananya Das    | Sales           | Account Manager       | 51000
2005 | Sneha Nair    | Finance         | Financial Analyst     | 104000
2008 | Ananya Verma  | Human Resource  | HR Manager            | 58000
2021 | Kiran Nair    | Human Resource  | HR Manager            | 55000
```

### 5c. Select the duplicate lines

**Command:**
```bash
cut -d"|" -f1,2,3,4,5 table | sort -f | uniq -i -d
```
**About:** `uniq -i -d` does the opposite of `-i -u`: it prints only the lines that **are** repeated once case is ignored. This correctly identifies the employee duplicate. `uniq` prints just one representative copy of the pair — here it's `sort -f` that keeps the original bytes as a tie-breaker for lines that are equal once folded, and uppercase letters sort before lowercase ones.

**Output:**
```
1007 | RAJESH DAS | MARKETING | MARKETING EXECUTIVE | 73000
```

---

## 6. From the file created in Q5, select the following

### 6a. Look for a name irrespective of case

**Command:**
```bash
grep -i 'Raj' table
```
**About:** `grep -i` performs a case-insensitive search, so it matches "Raj" regardless of whether it appears as "Raj", "RAJ", or any mixed case.

**Output:**
```
1003 | Rajesh Sharma | Human Resource | HR Coordinator      | 74000
1007 | Rajesh Das    | Marketing      | Marketing Executive | 73000
1007 | RAJESH DAS    | MARKETING      | MARKETING EXECUTIVE | 73000
```

### 6b. Show the line numbers that have the department (e.g. "Marketing")

**Command:**
```bash
grep -n 'Marketing' table
```
**About:** `grep -n` prefixes each matching line with its line number within the file. Here it's used to locate every record belonging to the "Marketing" department.

**Output:**
```
1: 1001 | Priya Sharma | Marketing | Marketing Executive | 74000
2: 1007 | Rajesh Das   | Marketing | Marketing Executive | 73000
```

### 6c. Extract lines where the Emp-ID begins with 2

**Command:**
```bash
grep "^2" table
```
**About:** The `^` symbol anchors the match to the start of the line, so `"^2"` matches only lines whose Emp-ID begins with 2.

**Output:**
```
2005 | Sneha Nair   | Finance        | Financial Analyst | 104000
2008 | Ananya Verma | Human Resource | HR Manager         | 58000
2021 | Kiran Nair   | Human Resource | HR Manager         | 55000
```

### 6d. Extract lines where the Emp-ID does NOT begin with 2

**Command:**
```bash
grep -v "^2" table
```
**About:** `grep -v` inverts the match, printing every line that does **not** match the pattern — i.e. every record whose Emp-ID does not begin with 2.

**Output:**
```
1001 | Priya Sharma  | Marketing      | Marketing Executive  | 74000
1002 | Amit Verma    | Sales          | Sales Executive       | 122000
1003 | Rajesh Sharma | Human Resource | HR Coordinator        | 74000
1004 | Sneha Nair    | Sales          | Sales Executive       | 119000
1006 | Neha Joshi    | Human Resource | HR Coordinator        | 137000
1007 | Rajesh Das    | Marketing      | Marketing Executive   | 73000
1009 | Ananya Das    | Sales          | Account Manager       | 51000
1007 | RAJESH DAS    | MARKETING      | MARKETING EXECUTIVE   | 73000
```
