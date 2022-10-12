import csv


def get_read_file(filename: str) -> list[list]:
    """ считывает файл csv в виде списка [[],[],...]"""
    with open(filename, "r", encoding="utf-8") as file:
        list_row = list(csv.reader(file))
    return list_row


def create_file_bd(filename: str, new_data: list[list]):
    """ создаёт файл filename.csv из списка new_data = [[],[],...]"""
    with open("files_bd/" + filename + ".csv", "w", encoding="utf-8",
              newline='') as file:  # newline=''- игнорируем пустые строки
        writer = csv.writer(file)
        for each in new_data:
            writer.writerow(tuple(each))


def get_revert_dict(dict_id_val: dict) -> list[list]:
    """ формирует структуру [[key,val1,val2],[]] из {key:[val1,val2],...} """
    new_data = []
    for key in dict_id_val:
        new_line = [key]
        for each in dict_id_val[key]:
            new_line.append(each)
        new_data.append(new_line)
    return new_data


def create_connection_table(old_bd, columns: list, name_column="") -> list[list]:
    """ декомпозирует список с данными, создавая таблицу из индексов полей columns"""
    ind = 0
    title = []
    for column in columns:
        title.append(old_bd[0][column])

    dict_id_val = {'Id': title}  # словарь {Id:[column_1,column_2]} для последующего создания новой таблицы
    for row in old_bd[1:]:
        line_data = []
        for column in columns:
            line_data.append(row[column])
        if line_data not in dict_id_val.values():
            ind += 1
            dict_id_val.update({ind: line_data})

    new_data = get_revert_dict(dict_id_val)  # замена структуры словаря на список списков
    create_file_bd(name_column, new_data)  # создаём файл с данными new_data и названием name_column

    new_table = []
    for each in old_bd:  # перебираем все строки исходных данных
        new_line = []
        ind = 0
        for column in each:  # перебираем все елементы строки
            if each.index(column) not in columns:  # если номер колонки отсутствует в списке
                new_line.append(column)  # переписываем, как есть
            elif ind == columns[0]:  # ниже первую колонку переписываем индексами из новой таблицы
                val_columns = []
                for each_col in columns:
                    val_columns.append(each[each_col])
                val_item = ""
                for item in dict_id_val:
                    if dict_id_val[item] == val_columns:
                        val_item = item
                if old_bd.index(each) == 0:  # если первая строка, то записываем шапку
                    new_line.append(name_column + '_id')
                else:
                    new_line.append(val_item)
            ind += 1
        new_table.append(new_line)
    return new_table


def main():
    ads_file = get_read_file("datasets/ads.csv")
    ads_file = create_connection_table(ads_file, [2], "author")  # создаём таблицу(файл) с авторами и записываем индексы
    ads_file = create_connection_table(ads_file, [5], "address")  # создаём таблицу(файл) с адресами и ...
    ads_file = create_connection_table(ads_file, [2, 5], "author_address")  # создаём таблицу(файл) автор-адрес и ...
    create_file_bd("connections", ads_file)  # создаём таблицу(файл) связей (основную)
    create_file_bd("categories", get_read_file("datasets/categories.csv"))  # пересоздаём таблицу(файл) категорий


if __name__ == '__main__':
    main()