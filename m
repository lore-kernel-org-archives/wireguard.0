Return-Path: j0eblack@teknik.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9991c2cc
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 13:23:49 +0000 (UTC)
Received: from mail.teknik.io (mail.teknik.io [50.247.95.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 867ba3c1
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 13:23:49 +0000 (UTC)
Mime-Version: 1.0
Date: Mon, 13 Feb 2017 13:37:51 +0000
Content-Type: text/plain; charset="utf-8"
Message-ID: <10506714ccc9074c7fca33401c985275@mail.teknik.io>
From: j0eblack@teknik.io
Subject: Re: WIreGuard on embedded devices and traffic shaping question.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9pyHASJVx0ZC1GNLgddgF_Dja7bqRxGoML8hCuWLaPbzg@mail.gmail.com>
References: <CAHmME9pyHASJVx0ZC1GNLgddgF_Dja7bqRxGoML8hCuWLaPbzg@mail.gmail.com>
 <91e1990891fb763b8090a2eed1321744@mail.teknik.io>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thank you for the reply, Jason.=0A=0AIndeed my email was a bit rushed, af=
ter some tweaking I was able to shape the entire 10.0.0.0/24 range since =
that is what I intend to use.=0A=0AI used again tc and qdisk as in my pre=
vious projects and everything is working flawlessly, the website is open =
for users to add their public keys.=0A=0AThe next couple of days I have s=
ome free time and I will start a short white-up how new people can get WG=
 going and eventually configure one of the peers to be a 'exit' point.=0A=
=0AThanks again for the awesome software!=0A=0ARegards,=0AJoe=0A=0AFebrua=
ry 11, 2017 11:20 AM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:=0A> H=
ey Joe,=0A> =0A> Sorry for the late reply. There was a conference and the=
n a small trip=0A> after, and now I'm catching up on the backlog.=0A> =0A=
> On Fri, Jan 27, 2017 at 12:05 PM, <j0eblack@teknik.io> wrote:=0A> =0A>>=
 If anyone is interested in this set-up I can write a short guide how you=
 can=0A>> achieve that and other people can point if any mistakes were ma=
de during the=0A>> setup.=0A> =0A> I'd certainly be interested in some so=
rt of blog write-up. The more=0A> documentation and tutorials, the better=
, IMHO.=0A> =0A>> Something that I want to do, and I was not able to find=
 information about it=0A>> in the mailing list or the docs on the website=
 is, can bandwidth (traffic=0A>> shaping) limits be applied between conne=
cted peers?=0A> =0A> The traffic shaping with WireGuard is the same trafi=
c shaping found in=0A> the rest of the Linux kernel -- the qdisc and tc s=
ubsystem. I think=0A> you can use the usual techniques there for applying=
 shaping to the=0A> entire interface or selectively to certain flows.=0A>=
 =0A>> I have done this in the past with open-vpn and tc (per IP address =
shaping)=0A>> and I am really curious if this can be done inside WireGuar=
d or not?=0A> =0A> I believe it can be using exactly that idea.=0A> =0A> =
Regards,=0A> Jason
