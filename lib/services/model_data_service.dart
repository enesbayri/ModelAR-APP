
class DataModel {
  final List<String> _category = [
    "Oyuncaklar","Eşyalar","Yiyecekler","Hayvanlar","Kutular","Ölçüler"
  ];
  final List<String> _categoryImg = [
    "1.png","2.jpg","3.jpg","4.jpg","5.png","6.jpg"
  ];
  final List _categoryContents = [
    ["BoomBox","BoomBoxWithAxes","BrainStem","CesiumMan","CesiumMilkTruck","DamagedHelmet","DragonAttenuation","Duck","FlightHelmet","IridescenceSuzanne","RiggedFigure","SciFiHelmet","Suzanne","ToyCar"],
    ["AnisotropyBarnLamp","AntiqueCamera","ClearCoatCarPaint","ClearcoatWicker","Corset","GlamVelvetSofa","GlassBrokenWindow","GlassHurricaneCandleHolder","GlassVaseFlowers","IridescenceAbalone","IridescenceLamp","IridescentDishWithOlives","Lantern","LightsPunctualLamp","MaterialsVariantsShoe","MosquitoInAmber","RecursiveSkeletons","RiggedSimple","SheenChair","SheenCloth","Sponza","StainedGlassLamp","TwoSidedPlane","VirtualCity","WaterBottle"],
    ["Avocado","MandarinOrange"],
    ["BarramundiFish","Fox"],
    ["AnimatedCube","AnimatedMorphCube","AnimatedTriangle","Box","BoxAnimated","BoxInterleaved","BoxTextured","BoxTexturedNonPowerOfTwo","BoxVertexColors","Cube","MultiUVTest","MultipleScenes","OrientationTest","SimpleMeshes","SimpleMorph","SimpleSkin","SimpleSparseAccessor","Triangle"],
    ["AlphaBlendModeTest","AnisotropyDiscTest","AnisotropyRotationTest","AnisotropyStrengthTest","AttenuationTest","ClearCoatTest","EmissiveStrengthTest","EnvironmentTest","InterpolationTest","IridescenceDielectricSpheres","IridescenceMetallicSpheres","MeshPrimitiveModes","MetalRoughSpheres","MetalRoughSpheresNoTextures","MorphPrimitivesTest","MorphStressTest","NegativeScaleTest","NormalTangentMirrorTest","NormalTangentTest","SimpleInstancing","SpecGlossVsMetalRough","SpecularTest","TextureCoordinateTest","TextureTransformMultiTest","TransmissionRoughnessTest","TransmissionTest","UnlitTest","VertexColorTest"],
  ];

// bunları alttaki linke göre kategorilere ekle. Görsellerini de assetse ekleyip modeller sayfasında listelemeyi sağla.
  final List<String> _secondModels = [
    "Astronaut","Horse","NeilArmstrong","RobotExpressive","RocketShip","alpha-blend-litmus",
  ];

//https://raw.githubusercontent.com/google/model-viewer/master/packages/shared-assets/models/Astronaut.glb

  List<String> getCategory(int index){
    return _categoryContents[index];
  }
  List<String> getSecondCategory(){
    return _secondModels;
  }
  
  String getCategoryImages(int index){
    return _categoryImg[index];
  }

  List<String> getCategories(){
    return _category;
  }

  List<String> getModelImageUrls(String modelName){
    return [
      "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Assets/main/Models/$modelName/screenshot/screenshot.png",
      "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Assets/main/Models/$modelName/screenshot/screenshot.jpg",
      "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Assets/main/Models/$modelName/screenshot/screenshot.gif",
    ];
  }

  String getModelSrc(int categoryIndex,int modelIndex){
    if( categoryIndex==0 && _categoryContents[categoryIndex].length <modelIndex+1){ // oyuncaklar kategorisinin sonuna 2.modellerin eklenmesi için
      return "https://raw.githubusercontent.com/google/model-viewer/master/packages/shared-assets/models/${getModelName(categoryIndex, modelIndex)}.glb";
    }else{
      String modelName = getModelName(categoryIndex, modelIndex);
      return 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Assets/main/Models/$modelName/glTF/$modelName.gltf';
    }
    
  }

  String getModelName(int categoryIndex,int modelIndex){
    if( categoryIndex==0 && _categoryContents[categoryIndex].length <modelIndex+1){
      return _secondModels[(modelIndex-(_categoryContents[categoryIndex].length)).toInt()];
    }else{
      return _categoryContents[categoryIndex][modelIndex];
    }
    
  }



}