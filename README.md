
### На оценку 4
 
1. Решение на C находится в папке [solution](https://github.com/axhse/CSA-HW-2/blob/main/solution)  
 
2. Полная компиляция:
```
gcc main.c -S -masm=intel -Wall -O0 -fno-asynchronous-unwind-tables -o main.s
gcc functional_heaven.c -S -masm=intel -Wall -O0 -fno-asynchronous-unwind-tables -o functional_heaven.s
gcc main.s -c -o main.o
gcc functional_heaven.s -c -o functional_heaven.o
gcc main.o functional_heaven.o -o solution.out

```
Все полученные файлы расположены в соответствующих папках:
- [compiled](https://github.com/axhse/CSA-HW-2/blob/main/compiled)  
- [assembled](https://github.com/axhse/CSA-HW-2/blob/main/assembled)  
- [linked](https://github.com/axhse/CSA-HW-2/blob/main/linked)  
Комментарии об эквивалентном представлении переменных содержатся в файлах  
[main_vars_and_params.s](https://github.com/axhse/CSA-HW-2/blob/main/commented/main_vars_and_params.s)
и [functional_heaven_vars_and_params.s](https://github.com/axhse/CSA-HW-2/blob/main/commented/functional_heaven_vars_and_params.s)  
Комментировались программы, полученные на шаге 3.  

3. Некоторые макросы были удалены вручную (основные: **endbr64**, **.long**, **.align** **.globl** **.size** **.type**, **.section**)   

4. Компилция и линковка:  
```
gcc main_less_macro.s -c -o main_less_macro.o
gcc functional_heaven_less_macro.s -c -o functional_heaven_less_macro.o
gcc main_less_macro.o functional_heaven_less_macro.o -o less_macro.out

```

5. Для тестирования используется скрипт
[program_tester.py](https://github.com/axhse/CSA-HW-2/blob/main/testing/program_tester.py)  
Тестировние проводится по сценариям [test_cases.py](https://github.com/axhse/CSA-HW-2/blob/main/testing/test_cases.py)  
Логи тестирования показываются в консоли и сохраняются в файл `testing_logs.txt`  
Запуски скрипта:
```
python3 program_tester.py ./solution.out
python3 program_tester.py ./less_macro.out
```
Логи тестирования, идентичные и полностью соответствующие ожиданиям, находятся в файлах  
[solution_testing_logs.txt](https://github.com/axhse/CSA-HW-2/blob/main/testing/solution_testing_logs.txt)
и [solution_less_macro_testing_logs.txt](https://github.com/axhse/CSA-HW-2/blob/main/testing/solution_less_macro_testing_logs.txt)  

### На оценку 5
 
1. В программе используются функции с передачей параметров (`test` и `generate_random`)  

2. В программе используется множество локальных переменных (например, `input_file_path` в `main`)  

3. Комментарии по передаче фактических параметров также добавлены в файлы
[main_vars_and_params.s](https://github.com/axhse/CSA-HW-2/blob/main/commented/main_vars_and_params.s)
и [functional_heaven_vars_and_params.s](https://github.com/axhse/CSA-HW-2/blob/main/commented/functional_heaven_vars_and_params.s)  

4. В тех же файлах содержатся комментарии по формальным параметрам на стеке и в регистрах  

### На оценку 6

1. С помощью ручного редактирования файлов [main_less_macro.s](https://github.com/axhse/CSA-HW-2/blob/main/modified/main_less_macro.s)
и [functional_heaven_less_macro.s](https://github.com/axhse/CSA-HW-2/blob/main/modified/functional_heaven_less_macro.s)
были получены [main_optimized.s](https://github.com/axhse/CSA-HW-2/blob/main/modified/main_optimized.s)
и [functional_heaven_optimized.s](https://github.com/axhse/CSA-HW-2/blob/main/modified/functional_heaven_optimized.s)  
Функцию было возможно сильно оптимизировать build_result_string, так как в программе на C содержались повторные копирования символов.  
Также, для хранения текущего символа и работы с ним можно использовать какой-нибудь регистр.  
Дополнительные идеи (не успел реализовать):  
1) Возможно, получится также хранить переменную цикла i в test с помощью регистра
2) Также, можно хранить переменную symbol в read_input с помощью регистра
3) Можно хранить переменные циклов i в write_output с помощью регистров
4) Аналогично рефакторингу в build_result_string, в write_output можно хранить адрес текущего символа в регистре

2. Все изменения прокомментированы в этих же файлах.  

3. Программа была также откопилирована и успешно протестирована:

```
gcc main_optimized.s -c -o main_optimized.o
gcc functional_heaven_optimized.s -c -o functional_heaven_optimized.o
gcc main_optimized.o functional_heaven_optimized.o -o optimized.out
python3 program_tester.py ./optimized.out

```
Полученные при компиляция файлы содержатся в соответствующих папках.  
Логи тестирования: [optimized_testing_logs.txt](https://github.com/axhse/CSA-HW-2/blob/main/testing/optimized_testing_logs.txt)  

4. Функция build_result_string заметно уменьшилась, остальное без особых изменений

### На оценку 7

1. Программа компилируется в 2 части

2. Сделано

3. Добавлены [test_simple.txt](https://github.com/axhse/CSA-HW-2/blob/main/testing/test_simple.txt)
и [test_all_symbols.txt](https://github.com/axhse/CSA-HW-2/blob/main/testing/test_all_symbols.txt)

### На оценку 8

1. Сделано

2. Сделано

3. Тестируется основная функция программы. Количество итераций можно задавать через командную строку

