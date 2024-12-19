program SplitEvenOdd;

var
  inputFile, oddFile, evenFile: TextFile;
  number: Real;
  i: Integer;

begin
  // Создаем исходный файл и записываем в него вещественные числа
  AssignFile(inputFile, 'C:\Users\Admin\Desktop\12 лаба\6.txt');
  Rewrite(inputFile);
  
  // Заполняем файл вещественными числами
  i := 1; // Инициализируем счетчик
  while i <= 10 do // Записываем 10 чисел
  begin
    number := Random * 100; // Генерируем случайное вещественное число от 0 до 100
    WriteLn(inputFile, number:0:2); // Записываем число с двумя знаками после запятой
    Inc(i); // Увеличиваем счетчик
  end;

  CloseFile(inputFile);

  // Открываем файлы для записи
  AssignFile(inputFile, 'C:\Users\Admin\Desktop\12 лаба\6.txt');
  Reset(inputFile);
  
  AssignFile(oddFile, 'C:\Users\Admin\Desktop\12 лаба\7.txt');
  Rewrite(oddFile);
  
  AssignFile(evenFile, 'C:\Users\Admin\Desktop\12 лаба\8.txt');
  Rewrite(evenFile);

  // Читаем исходный файл и записываем в новые файлы
  i := 1; // Счетчик для номеров строк
  while not Eof(inputFile) do
  begin
    ReadLn(inputFile, number);
    
    // Записываем в соответствующий файл в зависимости от номера строки
    if i mod 2 = 1 then
      WriteLn(oddFile, number:0:2) // Нечетные номера
    else
      WriteLn(evenFile, number:0:2); // Четные номера

    Inc(i); // Увеличиваем счетчик
  end;

  CloseFile(inputFile);
  CloseFile(oddFile);
  CloseFile(evenFile);
end.
