Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c50e836e
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 21:41:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 435b9cb8
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 21:41:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa15695c
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 21:40:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3757f1b7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 21:40:14 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 13-v6so12521660ois.1
 for <wireguard@lists.zx2c4.com>; Thu, 09 Aug 2018 14:52:45 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Aug 2018 14:52:33 -0700
Message-ID: <CAHmME9p1mWjphb0pbm0df_LnMFmbjS0EzW0M-TwiZyJ=mTUgwg@mail.gmail.com>
Subject: Reflections on WireGuard Design Goals
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey list,

For whatever reason, in the last several weeks, WireGuard been receiving a
considerable amount of attention, and with that comes various parties
interested in the project moving in this direction or in that direction. An=
d
more generally, over the last year or so, we've seen a decent amount of
interest from different folks wanting to do different things with the proje=
ct
and with the protocol. This inevitably leads to the question: what do we
actually want WireGuard to be, as a project, as a protocol, as a set of
implementations, as a design methodology, and so forth? I've had a pretty
clear idea about that, but I don't think I've ever tried to communicate
aspects of it in this context, so I thought here I'd highlight two importan=
t
design goals that motivate us.

Firstly, WireGuard intends on continuing to have a minimal core, without a =
lot
of options and wild features and support for weird networking paradigms. Su=
re,
we want the core to be sufficiently flexible that you can build interesting
and complex things on top of it, but we don't want WireGuard itself to be
complicated. We enjoy our small understandable configuration files, an
interface that appears to be mostly stateless, and general ease of use. Eve=
n
from a cryptography and implementation perspective, the protocol is designe=
d
to be implementable using simple algorithms and coding techniques.

With that kind of minimalism naturally comes the temptation to add things.
Simply from the perspective of an interested engineer, it's appealing to
extend and hack on small manageable codebases and projects, since adding a
single feature here or there just isn't that hard. And after all, if you're
*just* adding *one* feature, it's only one, and that's not so bad, right? A=
nd
what about one more? This kind of temptation applies equally to features
inside implementations as it does to features inside the protocol. And I th=
ink
this temptation is a little bit dangerous, both because it's an obvious
slippery slope to bloat ("just one more feature can't hurt, right guys?"), =
and
because while individual features or protocol enhancements might be well
thought-out, it's often hard to think through them in the context of a full=
er
system.

Secondly, WireGuard is engineered slowly and carefully. It is a conservativ=
e
project. Programming is fun, and so I understand the appeal to, "move fast =
and
break things," or to ship new code hastily. Personally I've written plenty =
of
such codebases, and that's usually fun and exciting. Except WireGuard is
deeply security-oriented. Of course there will inevitably be scary bugs we
weren't able to prevent, but we're moving slow and carefully to try to
mitigate those to the fullest extent we can. We want each of the
implementations released by the WireGuard project to be secure, high assura=
nce
software.

This means that although you can probably get something mostly "working" in=
 a
fairly short amount of time (an initial version of WireGuard took me
essentially a weekend), we're trying very hard not to throw junk over the
fence. Rather, we're doing pretty regular code reviews and have received so=
me
great feedback from some scary-talented security researchers, and we expect
for this to continue. But indeed not all programmers share this perspective=
 =E2=80=93
for a wide variety of motivations, both benign and opportunistic =E2=80=93 =
and so we
definitely will (and have, in fact, already) see folks making things relate=
d
to WireGuard who don't share this type of methodology.

Now I don't think these two motivating principles are particularly unique o=
r
innovative. Other security-focused projects, like OpenBSD for example, seem=
 to
be made of a somewhat similar mold. But these also certainly are not the
_norm_ for most projects out there. And as WireGuard accelerates in usage, =
I
expect we'll be facing this from a few angles:

- Attempts at commercialization: There are many businesses who want to embr=
ace
  WireGuard and extend it in some particular direction or another, in order=
 to
  build products or sell services or the usual array of business
  opportunities. Engineers working in these contexts often times are tempte=
d
  to extend minimal things in grotesque ways, and to push them to market wi=
th
  deadlines unfavorable to high assurance methodologies. It's naturally and
  understandably in the interest of businesses to attempt to steer the
  WireGuard project in directions aligned with their goals, or even directl=
y
  hire WireGuard developers away from an independent perspective working on
  the open source project. This is pretty commonplace with open source
  projects, and while sometimes everyone's interests align perfectly, it's
  easy to loose sight of the broader project goal; in particular, the goal =
of
  minimalism in particular is easy to leave by the wayside.

- Folks who want their own corner of the Internet: We've already seen this
  with a project, and as things accelerate, we'll probably also see it with
  others. It's fun to run a project, and some people want to start with
  WireGuard (and even our webpage design) but then spin it into all sorts o=
f
  new clever and creative things, extending the protocol, adding features,
  shipping code hastily, with the explicit caveat of not working within the
  WireGuard project or sticking with our design goals. Some folks simply
  aren't interested in joining community projects. While I understand the f=
un
  and motivation of having your own corner, depending on the scale, I think
  ultimately it's harmful to users and harmful to the project as a whole. I
  also understand that splintering projects might aid in creating commercia=
l
  opportunities too, but again, I think it is overall harmful to the
  ecosystem, whether open source or proprietary. I should  mention that The
  WireGuard project remains open to all sorts of development and developers
  who would like to join in, in any capacity, and indeed we're quite eager =
to
  continue to share or hand off maintenance burden to others. We're also
  willing and interested to work hand-in-hand with other open source projec=
ts
  that share our design goals and methodologies.

- The N+1 protocol: https://xkcd.com/927/ might just be a part of life. I
  expect we'll be seeing a proliferation of Noise-based VPN protocols,
  tailored for different use cases and environments, with differing securit=
y
  properties and attack surfaces. Designing protocols always involves
  trade-offs, and there are always interesting arguments for different
  trade-offs, and I wouldn't be surprised if we see some more WireGuard-lik=
e
  things come out. Perhaps someday down the line after years of observation=
,
  there will even be improvements made for a new WireGuard protocol,
  incorporating the rejuvenated research that's now being put into these ty=
pes
  of settings. Or not. But maybe. But either way, it seems likely there wil=
l
  be various N+1 protocol proposals and implementations, because people
  apparently like to make things; see XKCD.

So, if WireGuard remains a small niche project, we'll keep on keeping on
quietly and surely as ever. But should things continue to grow in usage as
we're seeing now, expect to see the various temptations proliferate. But
regardless, I certainly intend to keep WireGuard true to our design goals =
=E2=80=93 of
minimalism, of security conservatism =E2=80=93 and I'll be working hard to =
see that
through.

I should also reiterate that our doors remain very open to open source
developers and projects who wish to join the work we're doing.

Regards,
Jason
