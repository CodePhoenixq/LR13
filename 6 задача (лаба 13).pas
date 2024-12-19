
var
  inputFile, tempFile: TextFile;
  numbers: array of Real;
  minValue, maxValue: Real;
  minIndex, maxIndex: Integer;
  fileName: string;
  i: Integer;

begin
  Write('Введите имя файла (например, numbers.txt): ');
  ReadLn(fileName);

  // Проверка существования файла
  if not FileExists(fileName) then
  begin
    Writeln('Файл не существует!');
    Exit;
  end;

  // Открытие исходного файла для чтения
  AssignFile(inputFile, fileName);
  Reset(inputFile);

  // Считывание данных в массив
  SetLength(numbers, 0);
  while not Eof(inputFile) do
  begin
    SetLength(numbers, Length(numbers) + 1);
    Read(inputFile, numbers[High(numbers)]);
  end;
  CloseFile(inputFile);

  // Инициализация min и max значений
  minValue := numbers[0];
  maxValue := numbers[0];
  minIndex := 0;
  maxIndex := 0;

  // Поиск минимального и максимального элементов
  for i := 1 to High(numbers) do
  begin
    if numbers[i] < minValue then
    begin
      minValue := numbers[i];
      minIndex := i;
    end;
    if numbers[i] > maxValue then
    begin
      maxValue := numbers[i];
      maxIndex := i;
    end;
  end;

  // Проверка, нашли ли мы элементы
  if (minIndex = maxIndex) then
  begin
    Writeln('Все элементы одинаковы!');
    Exit;
  end;

  // Создание временного файла
  AssignFile(tempFile, 'temp.txt');
  Rewrite(tempFile);

  // Переписывание в временный файл с заменой местами мин и макс
  for i := 0 to High(numbers) do
  begin
    if i = minIndex then
      WriteLn(tempFile, maxValue:0:2)  // Записываем максимальное значение
    else if i = maxIndex then
      WriteLn(tempFile, minValue:0:2)  // Записываем минимальное значение
    else
      WriteLn(tempFile, numbers[i]:0:2); // Записываем остальные элементы
  end;

  // Закрытие временного файла
  CloseFile(tempFile);

  // Замена исходного файла временным файлом
  DeleteFile(fileName);           // Удаление исходного файла
  Rename(tempFile, fileName);     // Переименование временного файла в исходный

  Writeln('Минимальный и максимальный элементы были обменяны местами.');

end.
