Return-Path: tim@sedlmeyer.us
Return-Path: <tim@sedlmeyer.us>
MIME-Version: 1.0
References: <CAK_h9uHiudc2d_qOJgQeQd7+8oB-Kgr8nN_S5Y1hsBUu==Zd1w@mail.gmail.com>
 <CAHmME9r=H0Kp_3HYvxB62c3-LcMDKnYaTt-nn7b93JToWg91mA@mail.gmail.com>
In-Reply-To: <CAHmME9r=H0Kp_3HYvxB62c3-LcMDKnYaTt-nn7b93JToWg91mA@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.us>
Date: Thu, 23 Nov 2017 02:17:32 +0000
Message-ID: <CAK_h9uF_miSZs=sJ4b4Dx37Ukd-sO8p_cHzJVuDBN9f9waJZvQ@mail.gmail.com>
Subject: Re: Removing pre-shared key from peer using wg set fails
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c0551c688040a055e9d0a8a"
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0551c688040a055e9d0a8a
Content-Type: text/plain; charset="UTF-8"

Jason,

That fixed it.

Thanks,

Tim

On Wed, Nov 22, 2017 at 7:20 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Tim,
>
> Thanks for letting me know. This is a tools regression from
> 0.0.20171111, which I just fixed, based on your report:
>
>
> https://git.zx2c4.com/WireGuard/patch/?id=7153081da70006a8723474580543bd3223d1baf4
>
> Let me know if this fixes the issue. It will be included in the next
> snapshot.
>
> Regards,
> Jason
>

--94eb2c0551c688040a055e9d0a8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jason,<div><br></div><div>That fixed it.</div><div><br></d=
iv><div>Thanks,</div><div><br></div><div>Tim</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr">On Wed, Nov 22, 2017 at 7:20 PM Jason A. Donen=
feld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Tim,<br>
<br>
Thanks for letting me know. This is a tools regression from<br>
0.0.20171111, which I just fixed, based on your report:<br>
<br>
<a href=3D"https://git.zx2c4.com/WireGuard/patch/?id=3D7153081da70006a87234=
74580543bd3223d1baf4" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c=
4.com/WireGuard/patch/?id=3D7153081da70006a8723474580543bd3223d1baf4</a><br=
>
<br>
Let me know if this fixes the issue. It will be included in the next snapsh=
ot.<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div>

--94eb2c0551c688040a055e9d0a8a--
