local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.darker_night_1
  vim.g.terminal_color_1 = colors.red_11
  vim.g.terminal_color_2 = colors.green_14
  vim.g.terminal_color_3 = colors.yellow_13
  vim.g.terminal_color_4 = colors.arctic_blue_9
  vim.g.terminal_color_5 = colors.plum_15
  vim.g.terminal_color_6 = colors.ice_blue_8
  vim.g.terminal_color_7 = colors.light_snow_5
  vim.g.terminal_color_8 = colors.night_3
  vim.g.terminal_color_9 = colors.red_11
  vim.g.terminal_color_10 = colors.green_14
  vim.g.terminal_color_11 = colors.yellow_13
  vim.g.terminal_color_12 = colors.arctic_blue_9
  vim.g.terminal_color_13 = colors.plum_15
  vim.g.terminal_color_14 = colors.green_blue_7
  vim.g.terminal_color_15 = colors.lightest_snow_6 
end

M.setup = function()
  local config = require("nord").config
  local colors = require("nord.palette").get_base_colors()

  set_terminal_colors(colors)

  local groups = {
    -- Nord base groups
    NordFgSnow4 = { fg = colors.snow_4 },
    NordFgGreenBlue7 = { fg = colors.green_blue_7 },
    NordFgIceBlue8 = { fg = colors.ice_blue_8 },
    NordFgArcticBlue9 = { fg = colors.arctic_blue_9 },
    NordFgOceanBlue10 = { fg = colors.ocean_blue_10 },
    NordFgRed11 = { fg = colors.red_11 },
    NordFgPlum15 = { fg = colors.plum_15 },

    NordBgNight3 = { bg = colors.night_3 },

    -- attributes
    Bold = { bold = config.bold },
    Italic = { italic = config.italic.on },
    Underlined = { underline = config.underline },

    -- editor --
    ColorColumn = { bg = colors.darker_night_1 },
    Cursor = { fg = colors.darkest_night_0, bg = colors.snow_4 },
    CursorLine = { bg = colors.darker_night_1 },
    Error = { fg = colors.snow_4, bg = colors.red_11 },
    iCursor = { fg = colors.darkest_night_0, bg = colors.snow_4 },
    LineNr = { fg = colors.night_3, bg = "NONE" },
    MatchParen = { fg = colors.ice_blue_8, bg = colors.night_3 },
    NonText = { fg = colors.dark_night_2 },
    Normal = { fg = colors.snow_4, bg = colors.darkest_night_0 },
    Pmenu = { fg = colors.snow_4, bg = colors.darker_night_1 },
    PmenuSbar = { fg = colors.snow_4, bg = colors.darker_night_1 },
    PmenuSel = { fg = colors.ice_blue_8, bg = colors.night_3 },
    PmenuThumb = { fg = colors.ice_blue_8, bg = colors.night_3 },
    SpecialKey = { fg = colors.night_3 },
    SpellBad = { fg = colors.red_11, bg = colors.darkest_night_0, undercurl = config.undercurl, sp = colors.red_11 },
    SpellCap = { fg = colors.yellow_13 , bg = colors.darkest_night_0, undercurl = config.undercurl, sp = colors.yellow_13 },
    SpellLocal = { fg = colors.light_snow_5, bg = colors.darkest_night_0, undercurl = config.undercurl, sp = colors.light_snow_5 },
    SpellRare = { fg = colors.lightest_snow_6, bg = colors.darkest_night_0, undercurl = config.undercurl, sp = colors.lightest_snow_6 },
    Visual = { bg = colors.dark_night_2 },
    VisualNOS = { bg = colors.dark_night_2 },

    -- diff TODO: Consider supporting uniform_diff_background config option
    DiffAdd = { fg = colors.green_14, bg = colors.darker_night_1 },
    diffAdded = { link = "DiffAdd" },
    DiffChange = { fg = colors.yellow_13, bg = colors.darker_night_1 },
    diffChanged = { link = "DiffChange" },
    DiffDelete = { fg = colors.red_11, bg = colors.darker_night_1 },
    diffRemoved = { link = "DiffDelete" },
    DiffText = { fg = colors.arctic_blue_9, bg = colors.darker_night_1 },
    diffLine = { link = "NordFgIceBlue8" },
    diffSubname = { link = "Text" },
    -- git
    gitconfigVariable = { link = "NordFgGreenBlue7" },

    -- gutter
    CursorColumn = { bg = colors.darker_night_1 },
    CursorLineNr = { fg = colors.snow_4 },
    Folded = { fg = colors.night_3, bg = colors.darker_night_1, bold = config.bold },
    FoldColumn = { fg = colors.night_3, bg = colors.darkest_night_0 },
    SignColumn = { fg = colors.darker_night_1, bg = colors.darkest_night_0 },
    -- navigation
    Directory = { link = "NordFgIceBlue8" },
    -- prompt/status
    EndOfBuffer = { fg = colors.darker_night_1 },
    ErrorMsg = { fg = colors.snow_4, bg = colors.red_11 },
    ModeMsg = { link = "NordFgSnow4" },
    MoreMsg = { link = "NordFgIceBlue8" },
    Question = { link = "NordFgSnow4" },
    StatusLine = { fg = colors.ice_blue_8, bg = colors.night_3 },
    StatusLineNC = { fg = colors.snow_4, bg = colors.darker_night_1 },
    WarningMsg = { fg = colors.darkest_night_0, bg = colors.yellow_13 },
    WildMenu = { fg = colors.ice_blue_8, bg = colors.darker_night_1 },
    -- search
    IncSearch = { fg = colors.lightest_snow_6, bg = colors.ocean_blue_10, underline = config.underline },
    Search = { reverse = true, bg = colors.darker_night_1, fg = colors.ice_blue_8 },
    -- tabs
    TabLine = { fg = colors.snow_4, bg = colors.darker_night_1 },
    TabLineFill = { fg = colors.snow_4, bg = colors.darker_night_1 },
    TabLineSel = { fg = colors.ice_blue_8, bg = colors.night_3 },
    -- window
    Title = { fg = colors.snow_4 },
    VertSplit = { fg = colors.dark_night_2, bg = colors.darkest_night_0 },

    -- language based groups
    Boolean = { fg = colors.arctic_blue_9 },
    Character = { fg = colors.green_14 },
    Comment = { fg = colors.bright_night_3b, italic = config.italic.comments },
    Conceal = { bg = "NONE" },
    Conditional = { link = "NordFgArcticBlue9" },
    Constant = { link = "NordFgSnow4" },
    Decorator = { fg = colors.orange_12 },
    Define = { link = "NordFgArcticBlue9" },
    Delimiter = { fg = colors.lightest_snow_6 },
    Exception = { link = "NordFgArcticBlue9" },
    Float = { link = "NordFgPlum15" },
    Function = { link = "NordFgIceBlue8" },
    Identifier = { fg = colors.snow_4 },
    Include = { link = "NordFgArcticBlue9" },
    Keyword = { link = "NordFgArcticBlue9" },
    Label = { link = "NordFgArcticBlue9" },
    Number = { link = "NordFgPlum15" },
    Operator = { fg = colors.arctic_blue_9, italic = config.italic.operators },
    PreProc = { fg = colors.arctic_blue_9 },
    Repeat = { link = "NordFgArcticBlue9" },
    Special = { link = "NordFgSnow4" },
    SpecialChar = { fg = colors.yellow_13 },
    SpecialComment = { fg = colors.ice_blue_8, italic = config.italic.comments },
    Statement = { link = "NordFgArcticBlue9" },
    StorageClass = { link = "NordFgArcticBlue9" },
    String = { fg = colors.green_14, italic = config.italic.strings },
    Structure = { link = "NordFgArcticBlue9" },
    Tag = { link = "NordFgSnow4" },
    Todo = { fg = colors.yellow_13, bg = "NONE", italic = config.italic.comments },
    Type = { fg = colors.arctic_blue_9 },
    Typedef = { link = "NordFgArcticBlue9" },
    -- lang group links (all maybe not necessary)
    Annotation = { link = "Decorator" },
    Macro = { link = "Define" },
    PreCondit = { link = "PreProc" },
    Variable = { link = "Identifier" },


    -- Nevoim LSP Things
    healthError = { fg = colors.red_11, bg = colors.darker_night_1 },
    healthWarning = { fg = colors.yellow_13, bg = colors.darker_night_1 },
    healthSuccess = { fg = colors.green_14, bg = colors.darker_night_1 },
    TermCursorNC = { bg = colors.darker_night_1 },

    DiagnosticWarn = { fg = colors.yellow_13 },
    DiagnosticUnderlineWarn = { fg = colors.yellow_13, undercurl = config.undercurl },
    DiagnosticError = { link = "NordFgRed11" },
    DiagnosticUnderlineError = { fg = colors.red_11, undercurl = config.undercurl },
    DiagnosticInfo = { link = "NordFgIceBlue8" },
    DiagnosticUnderlineInfo = { fg = colors.ice_blue_8, undercurl = config.undercurl },
    DiagnosticHint = { link = "NordFgOceanBlue10" },
    DiagnosticUnderlineHint = { fg = colors.ocean_blue_10, undercurl = config.undercurl },
    LspCodeLens = { fg = colors.bright_night_3b },
    LspReferenceText = { link = "NordBgNight3" },
    LspReferenceRead = { link = "NordBgNight3" },
    LspReferenceWrite = { link = "NordBgNight3" },
    LspSignatureActiveParameter = { fg = colors.ice_blue_8, underline = config.underline },

    -- Treesitter
    -- These are the nord settings that differ from the defaults specified in the neovim docs or aren't clearly mentioned
    ['@constant.builtin'] = { link = "Constant" }, -- Default is "Special", nord currently deviates from that
    ['@constant.constructor'] = { link = "Function" }, -- Default is "Special"
    ['@constructor'] = { link = "Function" }, -- Default is "Special"
    ['@text.emphasis'] = { link = "Italic" }, -- Unknown default
    ['@function.builtin'] = { link = "Function" }, -- Default is "Special"
    ['@function.macro'] = { link = "Function" }, -- Default is "Macro"
    ['@string.regex'] = { link = "Italic" }, -- Unknown default
    ['@text.bold'] = { link = "Bold" }, -- Unknown default
    ['@variable.builtin'] = { link = "Keyword" }, -- Unknown default
    -- modified
    ['@tag.delimiter'] = { link = "Delimiter" },
    -- Unknown equivalents
    -- hi! link TSAnnotation Annotation
    -- hi! link TSStructure Structure


    -- Treesitter and LSP specific higlights
    -- "diff"
    ['@text.diff.add.diff'] = { link = "DiffAdd" },
    ['@text.diff.delete.diff'] = { link = "DiffDelete" },
    ['@function.diff'] = { link = "Type" },
    ['@attribute.diff'] = { link = "Text" },

    -- "typescript" and typescriptreact
    ['@type.typescript'] = { link = "NordFgGreenBlue7" },
    ['@lsp.type.interface.typescript'] = { link = "NordFgGreenBlue7" },
    ['@lsp.typemod.interface.declaration.typescript'] = { link = "NordFgGreenBlue7" },
    ['@lsp.typemod.type.declaration.typescript'] = { link = "NordFgGreenBlue7" },
    ['@punctuation.special.typescript'] = { link = "NordFgArcticBlue9" },
    ['@lsp.type.type.typescript'] = { link = "NordFgGreenBlue7" },
    ['@lsp.type.type.typescriptreact'] = { link = "NordFgGreenBlue7" },
    ['@lsp.type.enum.typescriptreact'] = { link = "NordFgGreenBlue7" },
    ['@lsp.type.interface.typescriptreact'] = { link = "NordFgGreenBlue7" },

    
    -- Language specic groups
    asciidocAttributeEntry = { link = "NordFgOceanBlue10" },
    asciidocAttributeList = { link = "NordFgOceanBlue10" },
    asciidocAttributeRef = { link = "NordFgOceanBlue10" },
    asciidocHLabel = { link = "NordFgArcticBlue9" },
    asciidocListingBlock = { link = "NordFgGreenBlue7" },
    asciidocMacroAttributes = { link = "NordFgIceBlue8" },
    asciidocOneLineTitle = { link = "NordFgIceBlue8" },
    asciidocPassthroughBlock = { link = "NordFgArcticBlue9" },
    asciidocQuotedMonospaced = { link = "NordFgGreenBlue7" },
    asciidocTriplePlusPassthrough = { link = "NordFgGreenBlue7" },
    asciidocAdmonition = { link = "Keyword" },
    asciidocAttributeRef = { link = "markdownH1" },
    asciidocBackslash = { link = "Keyword" },
    asciidocMacro = { link = "Keyword" },
    asciidocQuotedBold = { link = "Bold" },
    asciidocQuotedEmphasized = { link = "Italic" },
    asciidocQuotedMonospaced2 = { link = "asciidocQuotedMonospaced" },
    asciidocQuotedUnconstrainedBold = { link = "asciidocQuotedBold" },
    asciidocQuotedUnconstrainedEmphasized = { link = "asciidocQuotedEmphasized" },
    asciidocURL = { link = "markdownLinkText" },

    awkCharClass = { link = "NordFgGreenBlue7" },
    awkPatterns = { fg = colors.arctic_blue_9, bold = config.bold },
    awkArrayElement = { link = "Identifier" },
    awkBoolLogic = { link = "Keyword" },
    awkBrktRegExp = { link = "SpecialChar" },
    awkComma = { link = "Delimiter" },
    awkExpression = { link = "Keyword" },
    awkFieldVars = { link = "Identifier" },
    awkLineSkip = { link = "Keyword" },
    awkOperator = { link = "Operator" },
    awkRegExp = { link = "SpecialChar" },
    awkSearch = { link = "Keyword" },
    awkSemicolon = { link = "Delimiter" },
    awkSpecialCharacter = { link = "SpecialChar" },
    awkSpecialPrintf = { link = "SpecialChar" },
    awkVariables = { link = "Identifier" },

    cIncluded = { link = "NordFgGreenBlue7" },
    cOperator = { link = "Operator" },
    cPreCondit = { link = "PreCondit" },
    cConstant = { link = "Type" },

    cmakeGeneratorExpression = { link = "NordFgOceanBlue10" },

    csPreCondit = { link = "PreCondit" },
    csType = { link = "Type" },
    csXmlTag = { link = "SpecialComment" },

    cssAttributeSelector = { link = "NordFgGreenBlue7" },
    cssDefinition = { link = "NordFgGreenBlue7" },
    cssIdentifier = { fg = colors.green_blue_7, underline = config.underline },
    cssStringQ = { link = "NordFgGreenBlue7" },
    cssAttr = { link = "Keyword" },
    cssBraces = { link = "Delimiter" },
    cssClassName = { link = "cssDefinition" },
    cssColor = { link = "Number" },
    cssProp = { link = "cssDefinition" },
    cssPseudoClass = { link = "cssDefinition" },
    cssPseudoClassId = { link = "cssPseudoClass" },
    cssVendor = { link = "Keyword" },
    cssSelectorOp = { link = "Keyword" },

    dosiniHeader = { link = "NordFgIceBlue8" },
    dosiniLabel = { link = "Type" },

    dtBooleanKey = { link = "NordFgGreenBlue7" },
    dtExecKey = { link = "NordFgGreenBlue7" },
    dtLocaleKey = { link = "NordFgGreenBlue7" },
    dtNumericKey = { link = "NordFgGreenBlue7" },
    dtTypeKey = { link = "NordFgGreenBlue7" },
    dtDelim = { link = "Delimiter" },
    dtLocaleValue = { link = "Keyword" },
    dtTypeValue = { link = "Keyword" },

    elixirModuleDeclaration = { link = "NordFgGreenBlue7" },
    elixirAlias = { link = "NordFgGreenBlue7" },
    elixirAtom = { fg = colors.lightest_snow_6, bold = config.bold },

    goBuiltins = { link = "NordFgGreenBlue7" },
    goConstants = { link = "Keyword" },

    -- TODO Move out of langauge specific area?
    helpBar = { fg = colors.night_3 },
    helpHyperTextJump = { fg = colors.ice_blue_8, underline = config.underline },

    htmlArg = { link = "NordFgGreenBlue7" },
    htmlLink = { link = "NordFgSnow4" },
    htmlBold = { link = "Bold" },
    htmlEndTag = { link = "htmlTag" },
    htmlItalic = { link = "Italic" },
    htmlH1 = { link = "markdownH1" },
    htmlH2 = { link = "markdownH1" },
    htmlH3 = { link = "markdownH1" },
    htmlH4 = { link = "markdownH1" },
    htmlH5 = { link = "markdownH1" },
    htmlH6 = { link = "markdownH1" },
    htmlSpecialChar = { link = "SpecialChar" },
    htmlTag = { link = "Keyword" },
    htmlTagN = { link = "htmlTag" },
    htmlTagName = { link = "htmlTag" },

    javaDocTags = { link = "NordFgGreenBlue7" },
    javaCommentTitle = { link = "Comment" },

    javaScriptBraces = { link = "Delimiter" },
    javaScriptIdentifier = { link = "Keyword" },
    javaScriptNumber = { link = "Number" },

    jsonKeyword = { link = "NordFgGreenBlue7" },

    lessClass = { link = "NordFgGreenBlue7" },
    lessAmpersand = { link = "Keyword" },
    lessCssAttribute = { link = "Delimiter" },
    lessFunction = { link = "Function" },

    lispAtomBarSymbol = { link = "SpecialChar" },
    lispAtomList = { link = "SpecialChar" },
    lispAtomMark = { link = "Keyword" },
    lispBarSymbol = { link = "SpecialChar" },
    lispFunc = { link = "Function" },

    luaFunc = { link = "Function" },

    markdownBlockquote = { link = "NordFgGreenBlue7" },
    markdownCode = { link = "NordFgGreenBlue7" },
    markdownCodeDelimiter = { link = "NordFgGreenBlue7" },
    markdownFootnote = { link = "NordFgGreenBlue7" },
    markdownId = { link = "NordFgGreenBlue7" },
    markdownIdDeclaration = { link = "NordFgGreenBlue7" },
    markdownH1 = { link = "NordFgIceBlue8" },
    markdownLinkText = { link = "NordFgIceBlue8" },
    markdownUrl = { link = "NordFgSnow4" },
    markdownBold = { link = "Bold" },
    markdownBoldDelimiter = { link = "Keyword" },
    markdownFootnoteDefinition = { link = "markdownFootnote" },
    markdownH2 = { link = "markdownH1" },
    markdownH3 = { link = "markdownH1" },
    markdownH4 = { link = "markdownH1" },
    markdownH5 = { link = "markdownH1" },
    markdownH6 = { link = "markdownH1" },
    markdownIdDelimiter = { link = "Keyword" },
    markdownItalic = { link = "Italic" },
    markdownItalicDelimiter = { link = "Keyword" },
    markdownLinkDelimiter = { link = "Keyword" },
    markdownLinkTextDelimiter = { link = "Keyword" },
    markdownListMarker = { link = "Keyword" },
    markdownRule = { link = "Keyword" },
    markdownHeadingDelimiter = { link = "Keyword" },

    perlPackageDecl = { link = "NordFgGreenBlue7" },

    phpClasses = { link = "NordFgGreenBlue7" },
    phpDocTags = { link = "NordFgGreenBlue7" },
    phpDocCustomTags = { link = "phpDocTags" },
    phpMemberSelector = { link = "Keyword" },

    -- Perl related?
    podCmdText = { link = "NordFgGreenBlue7" },
    podVerbatimLine = { link = "NordFgSnow4" },
    podFormat = { link = "Keyword" },

    pythonBuiltin = { link = "Type" },
    pythonEscape = { link = "SpecialChar" },

    rubyConstant = { link = "NordFgGreenBlue7" },
    rubySymbol = { fg = colors.lightest_snow_6, bold = config.bold },
    rubyAttribute = { link = "Identifier" },
    rubyBlockParameterList = { link = "Operator" },
    rubyInterpolationDelimiter = { link = "Keyword" },
    rubyKeywordAsMethod = { link = "Function" },
    rubyLocalVariableOrMethod = { link = "Function" },
    rubyPseudoVariable = { link = "Keyword" },
    rubyRegexp = { link = "SpecialChar" },

    rustAttribute = { link = "NordFgOceanBlue10" },
    rustEnum = { fg = colors.green_blue_7, bold = config.bold },
    rustMacro = { fg = colors.ice_blue_8, bold = config.bold },
    rustModPath = { link = "NordFgGreenBlue7" },
    rustPanic = { fg = colors.arctic_blue_9, bold = config.bold },
    rustTrait = { fg = colors.green_blue_7, italic = config.italic.on },
    rustCommentLineDoc = { link = "Comment" },
    rustDerive = { link = "rustAttribute" },
    rustEnumVariant = { link = "rustEnum" },
    rustEscape = { link = "SpecialChar" },
    rustQuestionMark = { link = "Keyword" },

    sassClass = { link = "NordFgGreenBlue7" },
    sassId = { fg = colors.green_blue_7, underline = config.underline },
    sassAmpersand = { link = "Keyword" },
    sassClassChar = { link = "Delimiter" },
    sassControl = { link = "Keyword" },
    sassControlLine = { link = "Keyword" },
    sassExtend = { link = "Keyword" },
    sassFor = { link = "Keyword" },
    sassFunctionDecl = { link = "Keyword" },
    sassFunctionName = { link = "Function" },
    sassidChar = { link = "sassId" },
    sassInclude = { link = "SpecialChar" },
    sassMixinName = { link = "Function" },
    sassMixing = { link = "SpecialChar" },
    sassReturn = { link = "Keyword" },

    shCmdParenRegion = { link = "Delimiter" },
    shCmdSubRegion = { link = "Delimiter" },
    shDerefSimple = { link = "Identifier" },
    shDerefVar = { link = "Identifier" },

    sqlKeyword = { link = "Keyword" },
    sqlSpecial = { link = "Keyword" },

    tsxAttrib = { link = "NordFgGreenBlue7" },
    tsxEqual = { link = "Operator" },
    tsxIntrinsicTagName = { link = "htmlTag" },
    tsxTagName = { link = "NordFgArcticBlue9" },
    tsxCloseString = { link = "NordFgArcticBlue9" },

    typescriptOperator = { link = "Operator" },
    typescriptBinaryOp = { link = "Operator" },
    typescriptAssign = { link = "Operator" },
    typescriptMember = { link = "Identifier" },
    typescriptDOMStorageMethod = { link = "Identifier" },
    typescriptArrowFuncArg = { link = "Identifier" },
    typescriptGlobal = { link = "typescriptClassName" },
    typescriptBOMWindowProp = { link = "Function" },
    typescriptArrowFuncDef = { link = "Function" },
    typescriptAliasDeclaration = { link = "Function" },
    typescriptPredefinedType = { link = "NordFgGreenBlue7" },
    typescriptTypeReference = { link = "typescriptClassName" },
    typescriptTypeAnnotation = { link = "Structure" },
    typescriptDocNamedParamType = { link = "SpecialComment" },
    typescriptDocNotation = { link = "Keyword" },
    typescriptDocTags = { link = "Keyword" },
    typescriptImport = { link = "Keyword" },
    typescriptExport = { link = "Keyword" },
    typescriptTry = { link = "Keyword" },
    typescriptVariable = { link = "Keyword" },
    typescriptBraces = { link = "NordFgArcticBlue9" },
    typescriptObjectLabel = { link = "NordFgIceBlue8" },
    typescriptCall = { link = "Normal" },
    typescriptClassHeritage = { link = "typescriptClassName" },
    typescriptFuncTypeArrow = { link = "Structure" },
    typescriptMemberOptionality = { link = "Structure" },
    typescriptNodeGlobal = { link = "typescriptGlobal" },
    typescriptTypeBracket = { link = "NordFgIceBlue8" },
    typescriptParens = { link = "NordFgOceanBlue10" },
    typescriptTernaryOp = { link = "NordFgArcticBlue9" },
    -- typescriptBlock = { link = "NordFgArcticBlue9" },
    typescriptIndexExpr = { link = "NordFgArcticBlue9" },
    -- typescriptProperty = { link = "NordFgArcticBlue9" },
    typescriptUnaryOp = { link = "NordFgArcticBlue9" },
    typescriptExceptions = { link = "NordFgArcticBlue9" },

    vimAugroup = { link = "NordFgGreenBlue7" },
    vimMapRhs = { link = "NordFgGreenBlue7" },
    vimNotation = { link = "NordFgGreenBlue7" },
    vimFunc = { link = "Function" },
    vimFunction = { link = "Function" },
    vimUserFunc = { link = "Function" },

    xmlAttrib = { link = "NordFgGreenBlue7" },
    xmlCdataStart = { fg = colors.bright_night_3b, bold = config.bold },
    xmlNamespace = { link = "NordFgGreenBlue7" },
    xmlAttribPunct = { link = "Delimiter" },
    xmlCdata = { link = "Comment" },
    xmlCdataCdata = { link = "xmlCdataStart" },
    xmlCdataEnd = { link = "xmlCdataStart" },
    xmlEndTag = { link = "xmlTagName" },
    xmlProcessingDelim = { link = "Keyword" },
    xmlTagName = { link = "Keyword" },

    yamlBlockMappingKey = { link = "NordFgGreenBlue7" },
    yamlBool = { link = "Keyword" },
    yamlDocumentStart = { link = "Keyword" },

    -- Plugins
    --> tpope/vim-fugitive
    gitcommitDiscardedFile = { link = "NordFgRed11" },
    gitcommitUntrackedFile = { link = "NordFgRed11" },
    gitcommitSelectedFile = { fg = colors.green_14 },

    --> nvim-telescope/telescope.nvim
    TelescopeMatching = { link = "Label" },

    --> junegunn/vim-plug
    plugDeleted = { link = "NordFgRed11" },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M

