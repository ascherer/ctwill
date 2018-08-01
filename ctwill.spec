Name: ctwill
Summary: Create mini-indexes for literate programs
Packager: Andreas Scherer <https://ascherer.github.io>
Version: 3.64c
Source0: cweb-%{version}.tar.gz
Source1: %{name}-%{version}.tar.gz

%description
Create mini-indexes for literate programs.

%prep
%setup -c -a1

%build
make

%changelog
* Wed Aug 01 2018 Andreas Scherer <andreas_tex@freenet.de>
- Initial packaging.
