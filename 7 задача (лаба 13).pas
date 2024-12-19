var
  inputFile: TextFile;
  tempFile: TextFile;
  fileName: string;
  currentChar: char;
  i: Integer;

begin
  // Открытие исходного файла и временного файла
  AssignFile(inputFile, 'C:\Users\Admin\Desktop\12 лаба\7.1 задача.txt');
  Reset(inputFile);
  AssignFile(tempFile, 'C:\Users\Admin\Desktop\12 лаба\7.2 задача.txt');
  Rewrite(tempFile);

  i := 0;

  // Чтение файла и замена символов
  while not Eof(inputFile) do
  begin
    // Чтение текущего символа
    Read(inputFile, currentChar);

    // Проверка на чётную позицию (индекс начинается с 0)
    if i mod 2 = 0 then
      currentChar := '!';  // Замена на восклицательный знак

    // Запись символа во временный файл
    Write(tempFile, currentChar);
    Inc(i);  // Увеличение счетчика позиции
  end;

  // Закрытие файлов
  CloseFile(inputFile);
  CloseFile(tempFile);

  Writeln('Заменены символы с четными позициями на "!".');
end.