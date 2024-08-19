class FilterModel {
  final int statusCode;
  final bool status;
  final String message;
  final Map<String, dynamic> data;

  FilterModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      statusCode: json['status_code'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}

class Filter {
  final String? id;
  final String? question;
  final String? type;
  final List<Prompt>? prompts;
  final String? step;
  final String? section;
  final int? questionNo;
  final bool? mandatory;
  final bool? isFilter;
  final String? label;
  final String? key;
  final int? status;
  final DateTime? createdAt;

  Filter({
    this.id,
    this.question,
    this.type,
    this.prompts,
    this.step,
    this.section,
    this.questionNo,
    this.mandatory,
    this.isFilter,
    this.label,
    this.key,
    this.status,
    this.createdAt,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      type: json['type'] as String?,
      prompts: (json['prompts'] as List<dynamic>?)
          ?.map((prompt) => Prompt.fromJson(prompt as Map<String, dynamic>))
          .toList(),
      step: json['step'] as String?,
      section: json['section'] as String?,
      questionNo: json['question_no'] as int?,
      mandatory: json['mandatory'] as bool?,
      isFilter: json['is_filter'] as bool?,
      label: json['label'] as String?,
      key: json['key'] as String?,
      status: json['status'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'question': question,
      'type': type,
      'prompts': prompts?.map((prompt) => prompt.toJson()).toList(),
      'step': step,
      'section': section,
      'question_no': questionNo,
      'mandatory': mandatory,
      'is_filter': isFilter,
      'label': label,
      'key': key,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}

class Prompt {
  final String? promptValues;
  final List<NestedPrompt>? nestedPrompts;

  Prompt({
    this.promptValues,
    this.nestedPrompts,
  });

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(
      promptValues: json['prompt_values'] as String?,
      nestedPrompts: (json['nested_Prompts'] as List<dynamic>?)
          ?.map((nestedPrompt) =>
              NestedPrompt.fromJson(nestedPrompt as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt_values': promptValues,
      'nested_Prompts':
          nestedPrompts?.map((nestedPrompt) => nestedPrompt.toJson()).toList(),
    };
  }
}

class NestedPrompt {
  final String? nestedPromptValues;

  NestedPrompt({
    this.nestedPromptValues,
  });

  factory NestedPrompt.fromJson(Map<String, dynamic> json) {
    return NestedPrompt(
      nestedPromptValues: json['nested_prompt_values'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nested_prompt_values': nestedPromptValues,
    };
  }
}

class PriceRange {
  final List<int>? minPriceRange;
  final List<int>? maxPriceRange;

  PriceRange({
    this.minPriceRange,
    this.maxPriceRange,
  });

  factory PriceRange.fromJson(Map<String, dynamic> json) {
    return PriceRange(
      minPriceRange: (json['min_price_range'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      maxPriceRange: (json['max_price_range'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min_price_range': minPriceRange,
      'max_price_range': maxPriceRange,
    };
  }
}
