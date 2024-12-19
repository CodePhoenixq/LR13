var
  inputFile, outputFile: TextFile;
  line: string;
  lastSpacePos: Integer;

begin
  // Открываем файл для чтения
  AssignFile(inputFile, 'C:\Users\Admin\Desktop\12 лаба\3.txt');
  Reset(inputFile);
  
  // Читаем содержимое файла
  ReadLn(inputFile, line);
  CloseFile(inputFile);

  // Находим позицию последнего пробела
  lastSpacePos := LastPos(' ', line);

  // Если пробел найден, обрезаем строку до него
  if lastSpacePos > 0 then
    SetLength(line, lastSpacePos - 1); // Удаляем все после последнего пробела, включая его

  // Записываем измененное содержимое обратно в файл
  AssignFile(outputFile, 'C:\Users\Admin\Desktop\12 лаба\3.txt'); // Можно перезаписать тот же файл
  Rewrite(outputFile);
  WriteLn(outputFile, line);
  CloseFile(outputFile);
end.