
var
  f: TextFile;
  numbers: array of Real;
  i, n: Integer;
  sum: Real;

begin
  // Устанавливаем количество элементов
  n := 10;  // Например, 10 элементов

  // Устанавливаем длину массива
  SetLength(numbers, n);

  // Инициализируем массив с вещественными числами (например)
  for i := 0 to n - 1 do
  begin
    numbers[i] := Random(100) + Random;  // Генерация случайных вещественных чисел
  end;

  // Запись массива в файл
  AssignFile(f, 'C:\Users\Admin\Desktop\12 лаба\4 задача.txt');
  Rewrite(f);
  for i := 0 to n - 1 do
  begin
    WriteLn(f, numbers[i]:0:2);  // Запись числа в файл с двумя знаками после запятой
  end;
  CloseFile(f);

  // Сумма чётных элементов
  sum := 0.0;
  AssignFile(f, 'C:\Users\Admin\Desktop\12 лаба\4 задача.txt');
  Reset(f);
  
  i := 0;
  while not Eof(f) do
  begin
    if i mod 2 = 0 then // Чётный индекс (0, 2, 4, ...)
      ReadLn(f, numbers[i div 2]); // Считываем и добавляем
      sum := sum + numbers[i div 2];
    ReadLn(f); // Пропускаем следующий элемент
    Inc(i);  // Увеличиваем индекс на 1
  end;
  
  // Закрываем файл
  CloseFile(f);

  // Выводим результат
  WriteLn('Сумма элементов с четными номерами: ', sum:0:2);
end.
