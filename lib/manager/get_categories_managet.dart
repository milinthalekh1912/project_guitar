
import 'package:form/service/config_object.dart';
import 'package:form/service/product_categories_service/product_categories_service.dart';
import '../service/product_categories_service/product_categories_model.dart';

class CategoriesManager{
  Future<dynamic>getProductCategories(String productcategoriesId) async{
    var resultApi = await Get_ProductCategories_API_Service()
        .getProductCategoriesByIdRequest(authorizationModelOnDevice, productcategoriesId);
    if(resultApi.runtimeType == ProductCategoriesModel){
      ProductCategoriesModel productCategories = resultApi;
      return productCategories;
    }
    return null;
  }

  Future<dynamic>getMockProductCategories() async{
    var resultApi = await Get_ProductCategories_API_Service()
        .getProductCategoriesRequest(authorizationModelOnDevice);
    List<ProductCategoriesModel> listProductCate = [];
      for (var cate in resultApi) { //resultApi = categories
        List<String> subcatesId = [];
        for(var mapCateToSubCate in prodcat_prodsubcat) {
          if (int.parse(cate['id']) == mapCateToSubCate['ProdCatID']) {
            subcatesId.add(mapCateToSubCate['ProdSubCatID'].toString());
          }
        }
        listProductCate.add(ProductCategoriesModel(
          id: cate['id'],
          title: cate['title'],
          updateStatus: false,
          items: subcatesId,
        ));
      }

      return listProductCate;
    }
}


var prodcat_prodsubcat = [
{
"ProdCatID" : 1,
"ProdSubCatID" : 1
},
{
"ProdCatID" : 1,
"ProdSubCatID" : 2
},
{
"ProdCatID" : 1,
"ProdSubCatID" : 3
},
{
"ProdCatID" : 1,
"ProdSubCatID" : 4
},
{
"ProdCatID" : 2,
"ProdSubCatID" : 5
},
{
"ProdCatID" : 2,
"ProdSubCatID" : 6
},
{
"ProdCatID" : 2,
"ProdSubCatID" : 7
},
{
"ProdCatID" : 2,
"ProdSubCatID" : 8
},
{
"ProdCatID" : 2,
"ProdSubCatID" : 9
},
{
"ProdCatID" : 2,
"ProdSubCatID" : 10
},
{
"ProdCatID" : 3,
"ProdSubCatID" : 11
},
{
"ProdCatID" : 3,
"ProdSubCatID" : 12
},
{
"ProdCatID" : 4,
"ProdSubCatID" : 13
},
{
"ProdCatID" : 4,
"ProdSubCatID" : 14
},
{
"ProdCatID" : 4,
"ProdSubCatID" : 15
},
{
"ProdCatID" : 5,
"ProdSubCatID" : 16
},
{
"ProdCatID" : 5,
"ProdSubCatID" : 17
},
{
"ProdCatID" : 5,
"ProdSubCatID" : 18
},
{
"ProdCatID" : 6,
"ProdSubCatID" : 15
},
{
"ProdCatID" : 6,
"ProdSubCatID" : 19
},
{
"ProdCatID" : 6,
"ProdSubCatID" : 20
},
{
"ProdCatID" : 6,
"ProdSubCatID" : 21
},
{
"ProdCatID" : 7,
"ProdSubCatID" : 22
},
{
"ProdCatID" : 7,
"ProdSubCatID" : 23
},
{
"ProdCatID" : 7,
"ProdSubCatID" : 24
},
{
"ProdCatID" : 7,
"ProdSubCatID" : 25
},
{
"ProdCatID" : 8,
"ProdSubCatID" : 26
},
{
"ProdCatID" : 8,
"ProdSubCatID" : 27
},
{
"ProdCatID" : 8,
"ProdSubCatID" : 28
},
{
"ProdCatID" : 9,
"ProdSubCatID" : 26
},
{
"ProdCatID" : 9,
"ProdSubCatID" : 27
},
{
"ProdCatID" : 9,
"ProdSubCatID" : 28
},
{
"ProdCatID" : 10,
"ProdSubCatID" : 15
},
{
"ProdCatID" : 10,
"ProdSubCatID" : 29
},
{
"ProdCatID" : 10,
"ProdSubCatID" : 30
},
{
"ProdCatID" : 10,
"ProdSubCatID" : 31
},
{
"ProdCatID" : 11,
"ProdSubCatID" : 32
},
{
"ProdCatID" : 11,
"ProdSubCatID" : 33
},
{
"ProdCatID" : 12,
"ProdSubCatID" : 34
},
{
"ProdCatID" : 13,
"ProdSubCatID" : 35
},
{
"ProdCatID" : 13,
"ProdSubCatID" : 36
},
{
"ProdCatID" : 13,
"ProdSubCatID" : 37
},
{
"ProdCatID" : 13,
"ProdSubCatID" : 38
},
{
"ProdCatID" : 14,
"ProdSubCatID" : 39
},
{
"ProdCatID" : 14,
"ProdSubCatID" : 40
},
{
"ProdCatID" : 14,
"ProdSubCatID" : 41
},
{
"ProdCatID" : 14,
"ProdSubCatID" : 55
},
{
"ProdCatID" : 14,
"ProdSubCatID" : 56
},
{
"ProdCatID" : 14,
"ProdSubCatID" : 57
},
{
"ProdCatID" : 14,
"ProdSubCatID" : 58
},
{
"ProdCatID" : 15,
"ProdSubCatID" : 42
},
{
"ProdCatID" : 16,
"ProdSubCatID" : 43
},
{
"ProdCatID" : 17,
"ProdSubCatID" : 26
},
{
"ProdCatID" : 17,
"ProdSubCatID" : 27
},
{
"ProdCatID" : 18,
"ProdSubCatID" : 44
},
{
"ProdCatID" : 19,
"ProdSubCatID" : 45
},
{
"ProdCatID" : 19,
"ProdSubCatID" : 46
},
{
"ProdCatID" : 20,
"ProdSubCatID" : 47
},
{
"ProdCatID" : 20,
"ProdSubCatID" : 48
},
{
"ProdCatID" : 20,
"ProdSubCatID" : 49
},
{
"ProdCatID" : 21,
"ProdSubCatID" : 50
},
{
"ProdCatID" : 21,
"ProdSubCatID" : 51
},
{
"ProdCatID" : 21,
"ProdSubCatID" : 52
},
{
"ProdCatID" : 21,
"ProdSubCatID" : 53
},
{
"ProdCatID" : 21,
"ProdSubCatID" : 54
},
{
"ProdCatID" : 22,
"ProdSubCatID" : 59
},
{
"ProdCatID" : 23,
"ProdSubCatID" : 60
},
{
"ProdCatID" : 24,
"ProdSubCatID" : 61
},
{
"ProdCatID" : 25,
"ProdSubCatID" : 62
},
{
"ProdCatID" : 25,
"ProdSubCatID" : 63
},
{
"ProdCatID" : 25,
"ProdSubCatID" : 64
},
{
"ProdCatID" : 25,
"ProdSubCatID" : 65
},
{
"ProdCatID" : 26,
"ProdSubCatID" : 66
},
{
"ProdCatID" : 26,
"ProdSubCatID" : 67
},
{
"ProdCatID" : 26,
"ProdSubCatID" : 68
},
{
"ProdCatID" : 26,
"ProdSubCatID" : 69
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 70
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 71
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 72
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 73
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 74
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 75
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 76
},
{
"ProdCatID" : 27,
"ProdSubCatID" : 77
},
{
"ProdCatID" : 28,
"ProdSubCatID" : 78
},
{
"ProdCatID" : 28,
"ProdSubCatID" : 79
},
{
"ProdCatID" : 28,
"ProdSubCatID" : 80
},
{
"ProdCatID" : 29,
"ProdSubCatID" : 81
},
{
"ProdCatID" : 29,
"ProdSubCatID" : 82
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 83
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 84
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 85
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 86
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 87
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 88
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 89
},
{
"ProdCatID" : 30,
"ProdSubCatID" : 90
},
{
"ProdCatID" : 31,
"ProdSubCatID" : 15
},
{
"ProdCatID" : 31,
"ProdSubCatID" : 91
},
{
"ProdCatID" : 31,
"ProdSubCatID" : 92
},
{
"ProdCatID" : 31,
"ProdSubCatID" : 93
},
{
"ProdCatID" : 32,
"ProdSubCatID" : 94
},
{
"ProdCatID" : 32,
"ProdSubCatID" : 95
},
{
"ProdCatID" : 33,
"ProdSubCatID" : 76
},
{
"ProdCatID" : 33,
"ProdSubCatID" : 96
},
{
"ProdCatID" : 33,
"ProdSubCatID" : 97
},
{
"ProdCatID" : 34,
"ProdSubCatID" : 98
},
{
"ProdCatID" : 34,
"ProdSubCatID" : 99
},
{
"ProdCatID" : 34,
"ProdSubCatID" : 100
},
{
"ProdCatID" : 34,
"ProdSubCatID" : 101
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 102
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 103
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 104
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 105
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 106
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 107
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 108
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 109
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 110
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 111
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 112
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 113
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 114
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 115
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 116
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 117
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 118
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 119
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 120
},
{
"ProdCatID" : 35,
"ProdSubCatID" : 121
},
{
"ProdCatID" : 36,
"ProdSubCatID" : 122
},
{
"ProdCatID" : 36,
"ProdSubCatID" : 123
},
{
"ProdCatID" : 37,
"ProdSubCatID" : 124
},
{
"ProdCatID" : 37,
"ProdSubCatID" : 125
},
{
"ProdCatID" : 37,
"ProdSubCatID" : 126
},
{
"ProdCatID" : 38,
"ProdSubCatID" : 127
},
{
"ProdCatID" : 38,
"ProdSubCatID" : 128
},
{
"ProdCatID" : 38,
"ProdSubCatID" : 129
},
{
"ProdCatID" : 39,
"ProdSubCatID" : 130
},
{
"ProdCatID" : 39,
"ProdSubCatID" : 131
},
{
"ProdCatID" : 39,
"ProdSubCatID" : 132
},
{
"ProdCatID" : 40,
"ProdSubCatID" : 133
},
{
"ProdCatID" : 40,
"ProdSubCatID" : 134
},
{
"ProdCatID" : 40,
"ProdSubCatID" : 135
},
{
"ProdCatID" : 40,
"ProdSubCatID" : 136
},
{
"ProdCatID" : 40,
"ProdSubCatID" : 137
},
{
"ProdCatID" : 41,
"ProdSubCatID" : 123
},
{
"ProdCatID" : 41,
"ProdSubCatID" : 138
},
{
"ProdCatID" : 41,
"ProdSubCatID" : 139
},
{
"ProdCatID" : 41,
"ProdSubCatID" : 140
},
{
"ProdCatID" : 41,
"ProdSubCatID" : 141
},
{
"ProdCatID" : 41,
"ProdSubCatID" : 142
},
{
"ProdCatID" : 41,
"ProdSubCatID" : 143
},
{
"ProdCatID" : 42,
"ProdSubCatID" : 138
},
{
"ProdCatID" : 42,
"ProdSubCatID" : 139
},
{
"ProdCatID" : 42,
"ProdSubCatID" : 140
},
{
"ProdCatID" : 42,
"ProdSubCatID" : 143
},
{
"ProdCatID" : 42,
"ProdSubCatID" : 144
},
{
"ProdCatID" : 43,
"ProdSubCatID" : 145
},
{
"ProdCatID" : 43,
"ProdSubCatID" : 146
},
{
"ProdCatID" : 43,
"ProdSubCatID" : 147
},
{
"ProdCatID" : 43,
"ProdSubCatID" : 148
},
{
"ProdCatID" : 44,
"ProdSubCatID" : 15
},
{
"ProdCatID" : 44,
"ProdSubCatID" : 149
},
{
"ProdCatID" : 44,
"ProdSubCatID" : 150
},
{
"ProdCatID" : 44,
"ProdSubCatID" : 151
},
{
"ProdCatID" : 44,
"ProdSubCatID" : 152
},
{
"ProdCatID" : 45,
"ProdSubCatID" : 153
},
{
"ProdCatID" : 45,
"ProdSubCatID" : 154
},
{
"ProdCatID" : 46,
"ProdSubCatID" : 155
},
{
"ProdCatID" : 46,
"ProdSubCatID" : 156
},
{
"ProdCatID" : 46,
"ProdSubCatID" : 157
},
{
"ProdCatID" : 46,
"ProdSubCatID" : 158
},
{
"ProdCatID" : 46,
"ProdSubCatID" : 159
},
{
"ProdCatID" : 47,
"ProdSubCatID" : 3
},
{
"ProdCatID" : 47,
"ProdSubCatID" : 160
},
{
"ProdCatID" : 47,
"ProdSubCatID" : 161
},
{
"ProdCatID" : 47,
"ProdSubCatID" : 162
},
{
"ProdCatID" : 48,
"ProdSubCatID" : 163
},
{
"ProdCatID" : 48,
"ProdSubCatID" : 164
},
{
"ProdCatID" : 48,
"ProdSubCatID" : 165
},
{
"ProdCatID" : 49,
"ProdSubCatID" : 166
},
{
"ProdCatID" : 49,
"ProdSubCatID" : 167
},
{
"ProdCatID" : 50,
"ProdSubCatID" : 138
},
{
"ProdCatID" : 50,
"ProdSubCatID" : 139
},
{
"ProdCatID" : 50,
"ProdSubCatID" : 140
},
{
"ProdCatID" : 50,
"ProdSubCatID" : 144
},
{
"ProdCatID" : 50,
"ProdSubCatID" : 168
},
{
"ProdCatID" : 50,
"ProdSubCatID" : 169
},
{
"ProdCatID" : 51,
"ProdSubCatID" : 170
},
{
"ProdCatID" : 51,
"ProdSubCatID" : 171
},
{
"ProdCatID" : 51,
"ProdSubCatID" : 172
},
{
"ProdCatID" : 51,
"ProdSubCatID" : 173
},
{
"ProdCatID" : 52,
"ProdSubCatID" : 174
},
{
"ProdCatID" : 52,
"ProdSubCatID" : 175
},
{
"ProdCatID" : 52,
"ProdSubCatID" : 176
},
{
"ProdCatID" : 53,
"ProdSubCatID" : 177
},
{
"ProdCatID" : 53,
"ProdSubCatID" : 178
},
{
"ProdCatID" : 53,
"ProdSubCatID" : 179
},
{
"ProdCatID" : 53,
"ProdSubCatID" : 180
},
{
"ProdCatID" : 54,
"ProdSubCatID" : 181
},
{
"ProdCatID" : 54,
"ProdSubCatID" : 182
},
{
"ProdCatID" : 55,
"ProdSubCatID" : 183
},
{
"ProdCatID" : 55,
"ProdSubCatID" : 184
},
{
"ProdCatID" : 55,
"ProdSubCatID" : 185
},
{
"ProdCatID" : 55,
"ProdSubCatID" : 186
},
{
"ProdCatID" : 55,
"ProdSubCatID" : 187
},
{
"ProdCatID" : 56,
"ProdSubCatID" : 188
},
{
"ProdCatID" : 56,
"ProdSubCatID" : 189
},
{
"ProdCatID" : 56,
"ProdSubCatID" : 190
},
{
"ProdCatID" : 57,
"ProdSubCatID" : 191
},
{
"ProdCatID" : 57,
"ProdSubCatID" : 192
},
{
"ProdCatID" : 57,
"ProdSubCatID" : 193
},
{
"ProdCatID" : 57,
"ProdSubCatID" : 194
},
{
"ProdCatID" : 58,
"ProdSubCatID" : 195
},
{
"ProdCatID" : 58,
"ProdSubCatID" : 196
},
{
"ProdCatID" : 58,
"ProdSubCatID" : 197
},
{
"ProdCatID" : 59,
"ProdSubCatID" : 198
},
{
"ProdCatID" : 59,
"ProdSubCatID" : 199
},
{
"ProdCatID" : 59,
"ProdSubCatID" : 200
},
{
"ProdCatID" : 59,
"ProdSubCatID" : 201
},
{
"ProdCatID" : 59,
"ProdSubCatID" : 202
},
{
"ProdCatID" : 60,
"ProdSubCatID" : 203
},
{
"ProdCatID" : 60,
"ProdSubCatID" : 204
},
{
"ProdCatID" : 60,
"ProdSubCatID" : 205
},
{
"ProdCatID" : 60,
"ProdSubCatID" : 206
},
{
"ProdCatID" : 60,
"ProdSubCatID" : 207
},
{
"ProdCatID" : 60,
"ProdSubCatID" : 208
},
{
"ProdCatID" : 61,
"ProdSubCatID" : 209
},
{
"ProdCatID" : 61,
"ProdSubCatID" : 210
},
{
"ProdCatID" : 61,
"ProdSubCatID" : 211
},
{
"ProdCatID" : 62,
"ProdSubCatID" : 212
},
{
"ProdCatID" : 62,
"ProdSubCatID" : 213
},
{
"ProdCatID" : 62,
"ProdSubCatID" : 214
},
{
"ProdCatID" : 63,
"ProdSubCatID" : 215
},
{
"ProdCatID" : 64,
"ProdSubCatID" : 216
},
{
"ProdCatID" : 65,
"ProdSubCatID" : 217
},
{
"ProdCatID" : 66,
"ProdSubCatID" : 218
},
{
"ProdCatID" : 67,
"ProdSubCatID" : 219
},
{
"ProdCatID" : 68,
"ProdSubCatID" : 220
},
{
"ProdCatID" : 69,
"ProdSubCatID" : 221
},
{
"ProdCatID" : 70,
"ProdSubCatID" : 222
},
{
"ProdCatID" : 70,
"ProdSubCatID" : 223
},
{
"ProdCatID" : 70,
"ProdSubCatID" : 224
},
{
"ProdCatID" : 70,
"ProdSubCatID" : 225
},
{
"ProdCatID" : 71,
"ProdSubCatID" : 226
},
{
"ProdCatID" : 72,
"ProdSubCatID" : 227
},
{
"ProdCatID" : 73,
"ProdSubCatID" : 228
},
{
"ProdCatID" : 74,
"ProdSubCatID" : 229
},
{
"ProdCatID" : 75,
"ProdSubCatID" : 230
},
{
"ProdCatID" : 76,
"ProdSubCatID" : 231
},
{
"ProdCatID" : 77,
"ProdSubCatID" : 232
},
{
"ProdCatID" : 78,
"ProdSubCatID" : 233
},
{
"ProdCatID" : 79,
"ProdSubCatID" : 234
},
{
"ProdCatID" : 80,
"ProdSubCatID" : 235
},
{
"ProdCatID" : 81,
"ProdSubCatID" : 236
},
{
"ProdCatID" : 82,
"ProdSubCatID" : 237
},
{
"ProdCatID" : 83,
"ProdSubCatID" : 238
},
{
"ProdCatID" : 84,
"ProdSubCatID" : 239
},
{
"ProdCatID" : 85,
"ProdSubCatID" : 240
}
];