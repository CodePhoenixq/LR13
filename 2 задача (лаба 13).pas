program LongestStringsReversed;

var
  inputFile, outputFile: TextFile;
  line: string;
  longestLength, currentLength: Integer;
  longestLines: array of string;
 

begin
  // Открываем исходный файл для чтения
  AssignFile(inputFile, 'C:\Users\Admin\Desktop\12 лаба\4.txt');
  Reset(inputFile);
  
  longestLength := 0;

  // Сначала определяем максимальную длину строк
  while not Eof(inputFile) do
  begin
    ReadLn(inputFile, line);
    currentLength := Length(line);
    
    // Если текущая строка длиннее, обновляем максимальную длину
    if currentLength > longestLength then
    begin
      longestLength := currentLength;
      SetLength(longestLines, 0); // Сбрасываем массив, если нашли более длинную строку
    end;

    // Если длина строки равна максимальной, добавляем её в массив
    if currentLength = longestLength then
    begin
      SetLength(longestLines, Length(longestLines) + 1);
      longestLines[High(longestLines)] := line;
    end;
  end;

  CloseFile(inputFile);

  // Открываем новый файл для записи
  AssignFile(outputFile, 'C:\Users\Admin\Desktop\12 лаба\5.txt');
  Rewrite(outputFile);

  // Записываем строки в обратном порядке
  for var i := High(longestLines) downto 0
  do
  begin
    WriteLn(outputFile, longestLines[i]);
  end;

  CloseFile(outputFile);
end.
