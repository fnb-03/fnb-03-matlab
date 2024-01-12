classdef course %course isimli bir sınıfın tanımını yapar.classdef ifadesi, bir sınıf tanımı için kullanılır.course ismi, sınıfın adını belirtir.
    properties (SetAccess = private) %bir sınıfın özelliğinin değerinin yalnızca sınıfın içinden değiştirilebileceğini belirtir.properties ifadesi, bir sınıfın özelliklerinin tanımını yapar.SetAccess özelliği, özelliğin değerinin nasıl ayarlanacağını belirtir.private değeri, özelliğin değerinin yalnızca sınıfın içinden değiştirilebileceğini belirtir.
        Name (1,1) string %Name isimli bir matrisin (veya dizi) ilk elemanının değerini döndürür.Name ismi, matrisin (veya dizinin) adını belirtir.(1,1) ifadesi, matrisin (veya dizinin) ilk elemanını belirtir.
        Level (1,1) string {mustBeMember(Level,["White","Yellow","Green","Orange","Red"])} = "White" %Level (1,1):Bu, Level adlı bir matrisin (veya dizinin) ilk elemanına erişir.(1,1) dizini, ilk satırın ve ilk sütunun kesişimini, yani ilk elemanı belirtir.
        %string:Bu, Level matrisinin ilk elemanının bir metin dizesi olduğunu belirtir.
        %{mustBeMember(Level,["White","Yellow","Green","Orange","Red"])}:Bu, mustBeMember adlı bir doğrulama işlevidir.Level değişkeninin değerinin ["White","Yellow","Green","Orange","Red"] kümesinin bir üyesi olup olmadığını kontrol eder.Değer bu küme içinde değilse, bir hata oluşturur.
        %= "White":Bu, Level matrisinin ilk elemanına ilk değer olarak "White" metin dizisini atar.
        Waypoints (:,1) double {mustBePositive, mustBeInteger} %Waypoints (:,1):Bu, Waypoints adlı bir matrisin ilk sütununa erişir.(:,1) dizini, tüm satırları ve yalnızca ilk sütunu belirtir.
        %double:Bu, Waypoints matrisinin ilk sütununun bir sayı olduğunu belirtir.
        %mustBePositive işlevi, bir değerin pozitif olup olmadığını kontrol eder.
        %mustBeInteger işlevi, bir değerin tam sayı olup olmadığını kontrol eder.
        %Bu kodda, {mustBePositive, mustBeInteger} ifadesi, iki işlevin çıktılarını birleştirerek bir mantıksal ifade oluşturur. Bu ifade, Waypoints matrisinin ilk sütununun değerinin hem pozitif hem de tam sayı olup olmadığını kontrol eder.
    end % bitti demektir.

    methods % bir sınıfın yöntemlerini tanımlamak için kullanılır. Bir yöntem, bir sınıfın nesneleri tarafından gerçekleştirilebilecek bir işlevdir.
        function c = course(name,lvl,waypts) % course isimli bir işlevi tanımlar. Bu işlev, üç parametre alır:
        %name parametresi, course sınıfının name özelliğine atanır.
        %lvl parametresi, course sınıfının lvl özelliğine atanır.
        %waypts parametresi, course sınıfının waypts özelliğine atanır.
        %course sınıfının bir nesnesi oluşturulur ve c değişkenine atanır.
            if (nargin == 3) %işleve gönderilen bağımsız değişken sayısının 3 olup olmadığını kontrol eder. nargin değeri 3 ise, ifade doğrudur ve if bloğunun içeriği yürütülür. nargin değeri 3 değilse, ifade yanlıştır ve if bloğunun içeriği yürütülmez.
                name = convertCharsToStrings(name); %name değişkeninin değerini bir string dizisine dönüştürür.name değişkeninin değeri, bir char dizisi veya bir cell dizisi olabilir. convertCharsToStrings(name) ifadesi, name değişkeninin değerini string dizisine dönüştürür
                if isstring(name) %name değişkeninin değerinin bir string dizisi olup olmadığını kontrol eder.
                    c.Name = name; % c değişkeninin Name özelliğine name değerini atar.c değişkeni, bir sınıfın nesnesidir. Name özelliği, sınıfın bir özelliğidir.Bu ifade, c değişkeninin Name özelliğinin değerini name değerine ayarlar.
                else % eğer demektir.
                    error("Name must be text") % Name değişkeninin değerinin bir string dizisi olması gerektiğini belirten bir hata mesajı oluşturur. Name değişkeninin değerinin bir string dizisi olmadığını doğrular. Doğrulama başarısız olursa, hata mesajı görüntülenir.
                end % bitti demektir.
                c.Level = lvl; %c değişkeninin Level özelliğine lvl değerini atar.c değişkeni, bir sınıfın nesnesidir. Level özelliği, sınıfın bir özelliğidir.Bu ifade, c değişkeninin Level özelliğinin değerini lvl değerine ayarlar.
                if isnumeric(waypts) %waypts değişkeninin değerinin bir numeric veri türünde olup olmadığını kontrol eder.
                %waypts değişkeni, herhangi bir veri türünde olabilir. isnumeric(waypts) ifadesi, waypts değişkeninin değerinin bir numeric veri türü olup olmadığını kontrol eder
                %if isnumeric(waypts) ifadesi doğruysa, if bloğunun içeriği yürütülür. if isnumeric(waypts) ifadesi yanlışsa, if bloğunun içeriği yürütülmez.
                    c.Waypoints = waypts; % c değişkeninin Waypoints özelliğine waypts dizisini atar.c değişkeni, bir sınıfın nesnesidir. Waypoints özelliği, sınıfın bir özelliğidir.Bu ifade, c değişkeninin Waypoints özelliğinin değerini waypts dizisine ayarlar.
                else % eğer demektir.
                    error("Waypoints must be numeric") % Waypoints değişkeninin değerinin bir numeric veri türünde olması gerektiğini belirten bir hata mesajı oluşturur.
                    %Waypoints değişkeni, herhangi bir veri türünde olabilir. error("Waypoints must be numeric"); ifadesi, Waypoints değişkeninin değerinin bir numeric veri türü olmadığını doğrular. Doğrulama başarısız olursa, hata mesajı görüntülenir.
                end % bitti demektir.
            elseif (nargin > 0) %nargin değişkeninin değerinin 0'dan büyük olup olmadığını kontrol eder.nargin değişkeni, bir işleve gönderilen bağımsız değişkenlerin sayısını temsil eder.
            %elseif (nargin > 0) ifadesi doğruysa, elseif bloğunun içeriği yürütülür. elseif (nargin > 0) ifadesi yanlışsa, elseif bloğunun içeriği yürütülmez.


                error("You need to provide 3 inputs: name, level, and a list of waypoints") %bir hata mesajı oluşturarak kullanıcıya eksik girdi sağladığını bildirmek için kullanılır.
                %error() işlevi, MATLAB'da hata mesajları oluşturmak için kullanılır.Bu ifadede, hata mesajı olarak "You need to provide 3 inputs: name, level, and a list of waypoints" metni veriliyor.
                %Bu durumda, ifade, kullanıcıya işlevin doğru çalışması için 3 girdiye ihtiyacı olduğunu bildirir:name: Metin türündeki bir değişken, kurs veya diğer bir öğenin adını temsil eder.level: Sayısal türündeki bir değişken, kursun veya diğer bir öğenin zorluk seviyesini temsil eder.waypoints: Sayısal değerler içeren bir dizi (veya liste), bir robotun yolu veya bir rotadaki noktalar gibi bir dizi konumu temsil eder.
            end % bitti demektir.
        end % bitti demektir.

        function ok = checkWaypoint(c,id,wayptidx) %bir Course sınıfından bir nesnenin Waypoints özelliğinin wayptidx indeksindeki köşe noktasının id ile eşleşip eşleşmediğini kontrol eden bir işlev tanımlar.
        %function anahtar kelimesi, bir işlev tanımlamak için kullanılır.ok değişkeni, işlevin çıktısını temsil eder.c değişkeni, bir Course sınıfından bir nesnedir.id değişkeni, kontrol edilecek köşe noktasının kimliğini temsil eder.wayptidx değişkeni, kontrol edilecek köşe noktasının indeksini temsil eder.
            [~,prevwpidx] = max(id.Timestamps); %id değişkeninin Timestamps özelliğinin en büyük değerini ve bu değerin indeksini döndürür.
            %max() işlevi, bir dizideki en büyük değeri döndürür.~ değişkeni, NaN değerlerini yok saymak için kullanılır.prevwpidx değişkeni, max() işlevinin döndürdüğü indeksi temsil eder.
            ok = (wayptidx == (1+prevwpidx)); %wayptidx değişkeninin değerinin prevwpidx değişkeninin değerine 1 artmış değerine eşit olup olmadığını kontrol eder.
            %== operatörü, iki değişkenin değerinin eşit olup olmadığını kontrol etmek için kullanılır.1+prevwpidx ifadesi, prevwpidx değişkeninin değerine 1 ekler.
        end% bitti demektir.

        function disp(c) %c değişkeninin değerini yazdırır.function anahtar kelimesi, bir işlev tanımlamak için kullanılır.disp işlevi, bir değişkenin değerini yazdırmak için kullanılır.c değişkeni, yazdırılacak değişkeni temsil eder.
            n = numel(c); %c değişkeninin öğe sayısını n değişkenine atar.numel() işlevi, bir dizideki öğe sayısını döndürür.c değişkeni, öğe sayısı hesaplanmak istenen diziyi temsil eder.n değişkeni, öğe sayısının atanacağı değişkeni temsil eder.
            isarray = (n > 1); %n değişkeninin bir dizi olup olmadığını kontrol eder.isarray() işlevi, bir değişkenin bir dizi olup olmadığını kontrol etmek için kullanılır.n değişkeni, kontrol edilecek değişkeni temsil eder.
            if isarray %isarray() işlevinin döndürdüğü değerine göre bir koşul kontrolü yapar.if anahtar kelimesi, bir koşul kontrolünü başlatmak için kullanılır.isarray() işlevi, bir değişkenin bir dizi olup olmadığını kontrol etmek için kullanılır.
                disp("Array of "+n+" courses"+newline) % n değişkeninin değerini, yani "Array of" ve n değerini birleştirerek bir mesaj oluşturur ve bu mesajı bir satır sonu ile birlikte yazdırır.
                %disp() işlevi, bir değişkenin değerini yazdırmak için kullanılır.+"operatörü, iki değişkeni veya metni birleştirmek için kullanılır.newline metni, bir satır sonu karakteri temsil eder.
            end % bitti demektir.
            for k = 1:n %k değişkeninin değerini, yani 1'den n'ye kadar olan her tamsayı için bir döngü başlatır.for anahtar kelimesi, bir döngü başlatmak için kullanılır.k değişkeni, döngü boyunca değişecek değişkeni temsil eder.1:n ifadesi, 1'den n'ye kadar olan tamsayıları içeren bir diziyi temsil eder.
                if isarray %%isarray() işlevinin döndürdüğü değerine göre bir koşul kontrolü yapar.if anahtar kelimesi, bir koşul kontrolünü başlatmak için kullanılır.isarray() işlevi, bir değişkenin bir dizi olup olmadığını kontrol etmek için kullanılır.
                    str = string(k)+") "; %str değişkenine k değişkeninin değerinin bir karakter dizisine dönüştürülmüş halini, yani "1" değerini atar.
                else %eğer demektir.
                    str = ""; %ifadesi, str değişkenine boş bir karakter dizisi atar.str değişkeni, bir karakter dizisidir."" metni, boş bir karakter dizisini temsil eder.
                end % bitti demektir.
                if isempty(c(k).Waypoints) % c(k) dizisinin Waypoints özelliğinin boş olup olmadığını kontrol eder.isempty() işlevi, bir değişkenin boş olup olmadığını kontrol etmek için kullanılır.c(k) dizisi, k değeri ile belirtilen öğeyi temsil eder.Waypoints özelliği, c(k) dizisinin bir dizi waypoint içerdiğini temsil eder.
                    str = str + "Empty course"; %ifadesi, str değişkeninin değerine "Empty course" metnini ekler.str değişkeni, bir karakter dizisidir."Empty course" metni, "Boş kurs" ifadesini temsil eder.+ operatörü, iki değişkeni veya metni birleştirmek için kullanılır.
                    disp(str) %str değişkeninin değerini MATLAB komut penceresinde yazdırır.disp() işlevi, bir değişkenin değerini yazdırmak için kullanılır.str değişkeni, bir karakter dizisi veya sayısal bir değişken olabilir.
                else % eğer demektir.
                    str = str + c(k).Level + " course '" + c(k).Name + ..."' with " + numel(c(k).Waypoints) + " waypoints:"; %kursla ilgili bilgileri bir karakter dizisine birleştirmek için kullanılır.
                    %str = str + ...: Mevcut str karakter dizisine yeni bilgiler eklenir.c(k).Level: c adlı bir dizinin k indeksindeki öğenin Level özelliğini temsil eder (kurs seviyesi olduğu varsayılıyor).
                    %**" course '" + c(k).Name + ..."'": Kursun adını tırnak işaretleri içine alır.**with " + numel(c(k).Waypoints) + " waypoints:": Kursun kaç waypoint içerdiğini belirtir.
                    disp(str) %str değişkeninin değerini MATLAB komut penceresinde yazdırır.disp() işlevi, bir değişkenin değerini yazdırmak için kullanılır.str değişkeni, bir karakter dizisi veya sayısal bir değişken olabilir.
                    disp(c(k).Waypoints') %c dizisinin k indeksindeki öğenin Waypoints özelliğini yazdırır.c(k) ifadesi, c dizisinin k indeksindeki öğeyi döndürür.
                    %.Waypoints operatörü, c(k) öğesinin Waypoints özelliğini döndürür.disp() işlevi, c(k).Waypoints değerini MATLAB komut penceresinde yazdırır.
                end % bitti demektir.
            end % bitti demektir.
        end % bitti demektir.
    end % bitti demektir.

end % bitti demektir.
