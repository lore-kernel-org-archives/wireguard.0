Return-Path: georgewalkeriv@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db091e85
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 19:44:34 +0000 (UTC)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
 [209.85.223.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15866744
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 19:44:34 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id d11-v6so111676iof.11
 for <wireguard@lists.zx2c4.com>; Thu, 19 Apr 2018 12:44:42 -0700 (PDT)
MIME-Version: 1.0
From: George Walker <georgewalkeriv@gmail.com>
Date: Thu, 19 Apr 2018 15:44:39 -0400
Message-ID: <CAC92Z13zi6Gsq2CGwohZSEcF04Sa+m+WO3yCzWjXvn4DZuy-Rg@mail.gmail.com>
Subject: The case for anycast (contra move semantics for unicast AllowedIPs).
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="0000000000006d7072056a38cde5"
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 Juliusz Chroboczek <jch@irif.fr>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000006d7072056a38cde5
Content-Type: text/plain; charset="UTF-8"

Hi Jason, Juliusz, Toke, Dave, et. al.,

A year ago we discussed Multicast addressing and the move semantics for
allowedIPs. Recently, I've been mulling over move semantics and their
implication for WireGuard's support for anycast addressing.

Unlike Multicast addresses, there are no designated address ranges for
anycast: an anycast address is just a unicast address that's advertised in
more than one place. As I understand it, the move semantics for allowedIPs
preclude anycast addressing, as IP addresses can only be assigned to one
peer at a time. This makes me wonder if it might be more correct to allow
unicast allowedIPs to be assigned to more than one peer, treating them as
anycast in that case.

The problem I see with allowing anycast addressing in WireGuard is the
potential for breaking TCP and other stateful protocols. Perhaps that could
be addressed by somehow keeping sessions localized to a particular peer,
e.g., by using a distance metric (perhaps based upon GeoIP lookups) or
hash-based binning. I'm not sure what the best way to handle failover.

Also, if memory serves, move semantics account for a large proportion of
the troubleshooting requests that show up on this list, suggesting to me
that the status quo --elegant though it is!-- may not
be especially intuitive.

What do y'all think?


Best regards,
George

On Fri, Apr 7, 2017 at 4:42 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hey George,
>
> More excellent feedback, thanks. Be sure to CC the list next time though.
>
> If I understand correctly, your suggestion is to not clutter
> everything with a horrible "multi:" prefix, but instead allow
> multicast addressees, which are well defined, to be added to multiple
> peers, and only allow unicast addresses to be added to one peer at a
> time keeping the current behavior. I find that a very nice UI
> solution. Wonderful.
>
> Jason
>
> On Fri, Apr 7, 2017 at 6:02 PM, George Walker <georgewalkeriv@gmail.com>
> wrote:
> > Cons:
> > - A bit too magical.
> > - Seems to break paradigm.
> >
> >
> > Another is scalability --the computational and network overhead
> associated
> > with making every peer irrevocably a member of every multicast group.
> > Sending all multicast messages to all peers eliminates much of the
> benefit
> > of having more than one multicast address.  That could mean a lot of
> > unnecessary handshakes!  I can imagine applications for which this
> behavior
> > would make (accidental or malicious) DoS very easy.
> >
> > If you only have a lab-scale deployment and generous bandwidth, of course
> > receive-side filtering is fine.  But Wireguard's performance and general
> > utility would suggest that some will want big far-flung networks that may
> > well have need for lots of multicast groups (e.g. industrial IoT), while
> not
> > being able to afford to broadcast everything to everyone.
> >
> > Thus, there'd have to be
> > some explicit way of telling it, "yes I really do want this to be
> > duplicated, not moved". Perhaps a "multi:" prefix?
> >
> >
> > I respectfully disagree concerning the necessity to add special, ugly,
> > inconsistent UI for the multicast-as-multicast (instead of
> > multicast-as-broadcast) approach.  Multicast address ranges are
> well-known,
> > specified in RFCs.  That they behave a little bit differently from
> unicast
> > addresses is expected behavior.  Most of us ignore them and don't use
> those
> > ranges most or all of the time, which works fine.  Thus Multicast support
> > (e.g. in routers) doesn't generally interfere with the actual vs.
> expected
> > behavior of the unicast traffic most people use most of the time.
> >
> > Anyone who is diddling with networking at this level already knows how to
> > avoid multicast IPs when they intend unicast (whether they know they do
> or
> > not).
> >
> > It doesn't seem problematic for a layer 3 VPN to treat adding a unicast
> > address when such an address is already an allowedIP as different from
> > adding a multicast address (moving in the first case, adding in the
> second).
> > It sounds to me like doing the right (intuitive) thing in each case.
>

--0000000000006d7072056a38cde5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jason, Juliusz, Toke, Dave, et. al.,</div><div><br=
></div><div>A year ago we discussed Multicast addressing and the move seman=
tics for allowedIPs. Recently, I&#39;ve been mulling over move semantics an=
d their implication for WireGuard&#39;s support for anycast addressing.</di=
v><div><br></div><div>Unlike Multicast addresses, there are no designated a=
ddress ranges for anycast: an anycast address is just a unicast address tha=
t&#39;s advertised in more than one place. As I understand it, the move sem=
antics for allowedIPs preclude anycast addressing, as IP addresses can only=
 be assigned to one peer at a time. This makes me wonder if it might be mor=
e correct to allow unicast allowedIPs to be assigned to more than one peer,=
 treating them as anycast in that case.<br></div><div><br></div><div>The pr=
oblem I see with allowing anycast addressing in WireGuard is the potential =
for breaking TCP and other stateful protocols. Perhaps that could be addres=
sed by somehow keeping sessions localized to a particular peer, e.g., by us=
ing a distance metric (perhaps based upon GeoIP lookups) or hash-based binn=
ing. I&#39;m not sure what the best way to handle failover.</div><div><br><=
/div><div>Also, if memory serves, move semantics account for a large propor=
tion of the troubleshooting requests that show up on this list, suggesting =
to me that the status quo --elegant though it is!-- may not be=C2=A0especia=
lly=C2=A0intuitive.<br></div><div><br></div><div>What do y&#39;all think?</=
div><div><br></div><div><br></div><div>Best regards,</div><div>George</div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 7, 20=
17 at 4:42 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:J=
ason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">Hey George,<br>
<br>
More excellent feedback, thanks. Be sure to CC the list next time though.<b=
r>
<br>
If I understand correctly, your suggestion is to not clutter<br>
everything with a horrible &quot;multi:&quot; prefix, but instead allow<br>
multicast addressees, which are well defined, to be added to multiple<br>
peers, and only allow unicast addresses to be added to one peer at a<br>
time keeping the current behavior. I find that a very nice UI<br>
solution. Wonderful.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
On Fri, Apr 7, 2017 at 6:02 PM, George Walker &lt;<a href=3D"mailto:georgew=
alkeriv@gmail.com">georgewalkeriv@gmail.com</a>&gt; wrote:<br>
&gt; Cons:<br>
&gt; - A bit too magical.<br>
&gt; - Seems to break paradigm.<br>
&gt;<br>
&gt;<br>
&gt; Another is scalability --the computational and network overhead associ=
ated<br>
&gt; with making every peer irrevocably a member of every multicast group.<=
br>
&gt; Sending all multicast messages to all peers eliminates much of the ben=
efit<br>
&gt; of having more than one multicast address.=C2=A0 That could mean a lot=
 of<br>
&gt; unnecessary handshakes!=C2=A0 I can imagine applications for which thi=
s behavior<br>
&gt; would make (accidental or malicious) DoS very easy.<br>
&gt;<br>
&gt; If you only have a lab-scale deployment and generous bandwidth, of cou=
rse<br>
&gt; receive-side filtering is fine.=C2=A0 But Wireguard&#39;s performance =
and general<br>
&gt; utility would suggest that some will want big far-flung networks that =
may<br>
&gt; well have need for lots of multicast groups (e.g. industrial IoT), whi=
le not<br>
&gt; being able to afford to broadcast everything to everyone.<br>
&gt;<br>
&gt; Thus, there&#39;d have to be<br>
&gt; some explicit way of telling it, &quot;yes I really do want this to be=
<br>
&gt; duplicated, not moved&quot;. Perhaps a &quot;multi:&quot; prefix?<br>
&gt;<br>
&gt;<br>
&gt; I respectfully disagree concerning the necessity to add special, ugly,=
<br>
&gt; inconsistent UI for the multicast-as-multicast (instead of<br>
&gt; multicast-as-broadcast) approach.=C2=A0 Multicast address ranges are w=
ell-known,<br>
&gt; specified in RFCs.=C2=A0 That they behave a little bit differently fro=
m unicast<br>
&gt; addresses is expected behavior.=C2=A0 Most of us ignore them and don&#=
39;t use those<br>
&gt; ranges most or all of the time, which works fine.=C2=A0 Thus Multicast=
 support<br>
&gt; (e.g. in routers) doesn&#39;t generally interfere with the actual vs. =
expected<br>
&gt; behavior of the unicast traffic most people use most of the time.<br>
&gt;<br>
&gt; Anyone who is diddling with networking at this level already knows how=
 to<br>
&gt; avoid multicast IPs when they intend unicast (whether they know they d=
o or<br>
&gt; not).<br>
&gt;<br>
&gt; It doesn&#39;t seem problematic for a layer 3 VPN to treat adding a un=
icast<br>
&gt; address when such an address is already an allowedIP as different from=
<br>
&gt; adding a multicast address (moving in the first case, adding in the se=
cond).<br>
&gt; It sounds to me like doing the right (intuitive) thing in each case.<b=
r>
</div></div></blockquote></div><br></div></div>

--0000000000006d7072056a38cde5--
