some_str = "stanley"
some_bytes = b"stanley"
some_dict = {"age": 46}
some_int = 10
some_float = 20.0
some_set = {30}
some_list = [40]
some_tuple = (50,)


def try_to_mutate(
    x: int | float | list | str | tuple | dict | set | bytes,
) -> int | float | list | str | tuple | dict | set | bytes:
    object_type = x.__class__.__name__
    match object_type:
        case "int":
            x += 1

        case "float":
            x += 2.0

        case "list":
            x += [1, 2]

        case "str":
            x += "HUDSON"

        case "tuple":
            x += (1, 2)

        case "set":
            x.add(4)

        case "bytes":
            x += b"HUDSON"

        case "dict":
            x["name"] = "michael"
        case _:
            raise Exception(f"Unexpected type: {type(x)}")
    return x


for i in [
    some_str,
    some_bytes,
    some_dict,
    some_int,
    some_float,
    some_set,
    some_list,
    some_tuple,
]:
    object_type = i.__class__.__name__
    print(object_type.upper())
    print(
        f"The 'x' variable passed as argument to the function has value: {i} and ID: {id(i)}."
    )
    returned_value = try_to_mutate(i)

    id_conclusion = (
        "the same ID" if returned_value is i else f"ID: {id(returned_value)}"
    )
    print(
        f"The function returned an object with value: {returned_value} and {id_conclusion}."
    )
    variable_value_conclusion = (
        f"is changed to: {returned_value}"
        if returned_value == i
        else f"remains with the same value: {i}"
    )
    print(f"From now on, 'x' {variable_value_conclusion}.")
    mutability_conclusion = "Mutable" if i is returned_value else "Immutable"
    print(f"Conclusion: {mutability_conclusion}\n")
