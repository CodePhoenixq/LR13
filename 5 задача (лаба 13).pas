
var
  f: TextFile;
  numbers: array of Real;
  i, n: Integer;
  lastLocalMax: Real;
  found: Boolean;
  fileName: string;

begin
  Write('Введите имя файла (например, numbers.txt): ');
  ReadLn(fileName);

  // Проверяем, существует ли файл
  if not FileExists(fileName) then
  begin
    Writeln('Файл не существует!');
    Exit;
  end;

  // Открываем файл и считываем числа
  AssignFile(f, fileName);
  Reset(f);

  // Считываем все числа в массив
  SetLength(numbers, 0);
  while not Eof(f) do
  begin
    SetLength(numbers, Length(numbers) + 1);
    Read(f, numbers[High(numbers)]);
  end;
  CloseFile(f);

  // Ищем последний локальный максимум
  found := False;
  lastLocalMax := 0;

  for i := 1 to High(numbers) - 1 do
  begin
    if (numbers[i] > numbers[i - 1]) and (numbers[i] > numbers[i + 1]) then
    begin
      lastLocalMax := numbers[i];
      found := True;
    end;
  end;

  // Проверка первого и последнего элемента
  if (Length(numbers) > 1) then
  begin
    if (numbers[0] > numbers[1]) then
    begin
      lastLocalMax := numbers[0];
      found := True;
    end;
    
    if (numbers[High(numbers)] > numbers[High(numbers) - 1]) then
    begin
      lastLocalMax := numbers[High(numbers)];
      found := True;
    end;
  end;

  // Вывод результата
  if found then
    Writeln('Последний локальный максимум: ', lastLocalMax:0:2)
  else
    Writeln('Локальные максимумы не найдены.');

end.
