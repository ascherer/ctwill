Name: ctwill
Summary: Create mini-indexes for literate programs
License: Copyright Donald E. Knuth
URL: ftp://ftp.cs.stanford.edu/pub/ctwill

Version: 3.64c
Release: 1
Packager: Andreas Scherer <https://ascherer.github.io>
Distribution: Kubuntu 16.04 (x86_64)

Source0: ftp://ftp.cs.stanford.edu/pub/cweb/cweb-%{version}.tar.gz
Source1: ftp://ftp.cs.stanford.edu/pub/ctwill/%{name}-%{version}.tar.gz

Patch1: 0001-Make-clean-twinx.patch
Patch2: 0002-Make-clean-refsort.patch
Patch3: 0003-Fix-compiler-warnings-in-common.h.patch
Patch4: 0004-Fix-compiler-warnings-in-common.w.patch
Patch5: 0005-Clean-compile-of-ctwill.patch
Patch6: 0006-Put-refsort-s-index-in-a-separate-section.patch
Patch7: 0007-Improve-cleanup.patch
Patch8: 0008-Missing-page-break.patch

%define texmf /opt/texlive/texmf-local

%description
Create mini-indexes for literate programs.

%prep
%autosetup -c -a1

%build
%{__make}

%install
%{__rm} -rf %{buildroot}
%{__install} -d %{buildroot}%{_bindir} \
	%{buildroot}%{texmf}/tex/plain/cweb
%{__install} ctwill refsort twinx %{buildroot}%{_bindir}
%{__install} -m 644 ctwimac.tex proofmac.tex twinxmac.tex \
	%{buildroot}%{texmf}/tex/plain/cweb

%files
%defattr(-,root,root,-)
%{texmf}/tex/plain/cweb/ctwimac.tex
%{texmf}/tex/plain/cweb/proofmac.tex
%{texmf}/tex/plain/cweb/twinxmac.tex
%{_bindir}/ctwill
%{_bindir}/refsort
%{_bindir}/twinx

%changelog
* Wed Aug 01 2018 Andreas Scherer <andreas_tex@freenet.de>
- Initial packaging.
