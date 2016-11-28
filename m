Return-Path: Marco.Bubke@qt.io
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0124.outbound.protection.outlook.com [104.47.2.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09ec0137
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Nov 2016 19:45:08 +0000 (UTC)
From: Marco Bubke <Marco.Bubke@qt.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "qt-creator@qt-project.org"
 <qt-creator@qt-project.org>
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
Date: Mon, 28 Nov 2016 19:49:26 +0000
Message-ID: <HE1PR02MB16597D89414EB2F7E6265BA2F08A0@HE1PR02MB1659.eurprd02.prod.outlook.com>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
 <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
In-Reply-To: <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
Content-Type: text/plain; charset="Windows-1252"
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

=0A=
=0A=
On November 28, 2016 19:03:57 "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:=
=0A=
=0A=
> Hello All,=0A=
>=0A=
> Responses to each of you are inline below.=0A=
>=0A=
> Sounds to me like there's a lot of work to be done, still, and I=0A=
> haven't received any enthusiastic responses from the Qt team of, "yes!=0A=
> we'd love to work on this and make Qt Creator suitable for kernel=0A=
> development!" Bummer. Seems like a great opportunity to increase the=0A=
> tool's user appeal.=0A=
>=0A=
> On Wed, Nov 23, 2016 at 8:45 AM, Konstantin Tokarev <annulen@yandex.ru> w=
rote:=0A=
>> BTW, I'm facing similar issue with QtWebKit: config.h is included into a=
ll=0A=
>> source files, but never in headers, so all #if's in headers are disabled=
=0A=
>> and code model does not function properly.=0A=
>=0A=
> Yep, this is pretty much entirely broken. It's not implemented in the=0A=
> Qt C++ model, and it straight up does not work in the clang mode=0A=
> model. The lack of good support for this feature -- project wide=0A=
> -include file -- is pretty limiting.=0A=
>=0A=
> On Wed, Nov 23, 2016 at 8:58 AM, Orgad Shaneh <orgads@gmail.com> wrote:=
=0A=
>> Which version do you use? Designated initializers support was added in 3=
.2=0A=
>> (c56b999ffff249d4cb7dc7e8026a3297b63ff56d).=0A=
>>=0A=
>> I now see that the members are not detected correctly (for e.g. Find=0A=
>> Usages), but parsing looks ok.=0A=
>=0A=
> I'm using 4.1. No, it still does not work. Here's a screenshot:=0A=
> https://data.zx2c4.com/designated-init-broken-qt-creator-49b6f51f.png=0A=
>=0A=
>> You can set PRECOMPILED_HEADER =3D header.h in your pro file. It should =
be=0A=
>> applied to all sources.=0A=
>=0A=
> Nope, that's certainly not what that field does.=0A=
>=0A=
> On Wed, Nov 23, 2016 at 10:21 AM, Eike Ziller <Eike.Ziller@qt.io> wrote:=
=0A=
>> Are you using the ClangCodeModel plugin? If not, you probably should.=0A=
>> It does not help for things like find usages and locator, since for this=
 we still use the built-in model,=0A=
>> and fixes for the built-in model will be very limited.=0A=
>> But for working with the individual _source_ file it should at least hel=
p.=0A=
>> I can even open Objective-C++ files and get decent highlighting and even=
=0A=
>> get some completion for Objective-C ;)=0A=
>=0A=
> The clang mode model is even more buggy than the built-in one. Not=0A=
> only that, but it's an order of magnitude slower too, which makes Qt=0A=
> Creator impossible to use. The only viable usage of the IDE is through=0A=
> the built-in code model. Hopefully the Qt engineers will put in the=0A=
> time to bring it up to par with modern times with -include, and add=0A=
> explicit C support...=0A=
=0A=
What is exactly buggy? The code model can handle C but we need that informa=
tion from the project management. QMake isn't differentiating between C and=
 C++ headers,  so we simply don't get that information. Like other have wri=
tten there could be workarounds. Anyway it would be interesting what is you=
r environment that makes the clang code model so slow. It's quite fine for =
me. There is the header guard bug which is vanishing with #pragma once. Wha=
t are actually your problems? =0A=
=0A=
>=0A=
>> One other issue are header files - there is no way Qt Creator can automa=
tically tell if a=0A=
>> .h file is supposed to be C, C++, Objective-C, Objective-C++, ....=0A=
>> One hack workaround for C might be to remove *.h from the text/x-c++hdr =
mime type in Options > Environment > Mime Types,=0A=
>> but that would be a big and global hack (if it worked) ;)=0A=
>> We could probably provide a project setting for a =93default=94 language=
 to use though, which would then also be sharable with all in the project s=
ources with a .shared file.=0A=
>=0A=
> A project-wide setting would indeed be most welcome for this.=0A=
>=0A=
>=0A=
> On Wed, Nov 23, 2016 at 5:15 PM, Andrzej Telszewski=0A=
> <atelszewski@gmail.com> wrote:=0A=
>> I don't remember exactly, but I used some other feature of QtC (Import=
=0A=
>> Project was it?).=0A=
>> It allowed to easily setup QtC for kernel development.=0A=
>> It worked pretty well, most of the time.=0A=
>> Just a quick search:=0A=
>> http://stackoverflow.com/questions/5417732/howto-prepare-qtcreator-for-l=
inux-driver-kernel-development=0A=
>=0A=
> The solution listed here is basically wrong and doesn't work. The code=0A=
> model won't actually parse that #include properly.=0A=
>=0A=
>>=0A=
>> I too remember seeing false errors when code model parsed struct members=
=0A=
>> initializers.=0A=
>>=0A=
>> But this code seems to work just fine now:=0A=
>=0A=
> Try something slightly more complicated and it totally blows up again.=0A=
> See the linked screenshot above.=0A=
>=0A=
>> And yes, although I'm not going to be involved in enhancing QtC, I would=
=0A=
>> love to see C receiving decent support.=0A=
>> QtC is my main (well, the only) IDE, and I write both C and C++ code.=0A=
>=0A=
> If only the Qt developers cared about this too. Missed opportunity IMHO.=
=0A=
>=0A=
> Jason=0A=
> _______________________________________________=0A=
> Qt-creator mailing list=0A=
> Qt-creator@qt-project.org=0A=
> http://lists.qt-project.org/mailman/listinfo/qt-creator=0A=
