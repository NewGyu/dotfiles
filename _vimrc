"Vi�݊����I�t
set nocompatible
"set number
"�o�b�N�A�b�v�t�@�C�������f�B���N�g��
set backupdir=$HOME/vimbackup
set directory=$HOME/vimbackup
"�t�@�C���ۑ��_�C�A���O�̏����f�B���N�g�����o�b�t�@�t�@�C���ʒu�ɐݒ�
set browsedir=buffer 
"�N���b�v�{�[�h��Windows�ƘA�g
set clipboard=unnamed
"�^�u,�C���f���g�֌W
set autoindent
set expandtab
set ts=4 sw=2 sts=2
set smarttab
set smartindent

"�����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�\������
set showmatch
"�ύX���̃t�@�C���ł��A�ۑ����Ȃ��ő��̃t�@�C����\��
set hidden
"�C���N�������^���T�[�`���s��
set incsearch
"�^�u�����A�s���ȂǕs��������\������
set list
set listchars=tab:>\ ,extends:<

"�J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]

"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
