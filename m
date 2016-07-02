Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a29fc5f
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 14:52:30 +0000 (UTC)
Date: Sat, 2 Jul 2016 16:55:28 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <20160702145528.GI12181@lud.polynome.dn42>
References: <20160702132018.GH12181@lud.polynome.dn42>
 <7706182d-aa0e-9c7e-a550-b88b4857fdee@hauke-m.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ofZMSlrAVk9bLeVm"
In-Reply-To: <7706182d-aa0e-9c7e-a550-b88b4857fdee@hauke-m.de>
Cc: lede-dev@lists.infradead.org, wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [LEDE-DEV] Kernel symbol dependencies and KCONFIG
 usage for kernel packages
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--ofZMSlrAVk9bLeVm
Content-Type: multipart/mixed; boundary="Op27XXJsWz80g3oF"
Content-Disposition: inline


--Op27XXJsWz80g3oF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 02, 2016 at 03:48:36PM +0200, Hauke Mehrtens wrote:
> > However, I have some trouble understanding what KCONFIG does.  Wireguard
> > needs a few kernel options, so I thought that KCONFIG was the place to
> > declare such dependencies:
> >=20
> >   https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Make=
file#L90
>=20
> > KCONFIG:=3DCONFIG_NET_UDP_TUNNEL CONFIG_IPV6 \
> >          CONFIG_NETFILTER_XT_MATCH_HASHLIMIT
>=20
> Instead of activating the kernel symbols you should add a dependency to
> the packages which are building these models:
>=20
> DEPENDS:=3D+kmod-udptunnel4 +kmod-udptunnel6 +kmod-ipt-hashlimit

Well, actually, this is already there, on the next line :)

  https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Makefile=
#L91

So, I can remove the KCONFIG line altogether?  I thought the kernel
symbols activated some necessary machinery in the kernel, in addition to
producing the .ko module.

I think I found the cause of the issue: the packages kmod-udptunnel4.ipk
and kmod-udptunnel6.ipk are generated, but are empty (no .ko file).  When
I activate the kernel symbol in kernel_menuconfig, these packages do
provide the .ko files as expected.

I have attached the empty packages to this email, just in case.

Thanks,
Baptiste

--Op27XXJsWz80g3oF
Content-Type: application/vnd.shana.informed.package
Content-Disposition: attachment; filename="kmod-udptunnel4_4.4.14-1_mips_34kc.ipk"
Content-Transfer-Encoding: base64

H4sIAAAAAAAAA9PTT0lNykzM003KzEssqmSgBTAAAjMTEzANBOg0EJgwGBqZG5uamZuaGxgx
GBgaGZsaMCgY0MQ1aKC0uCSxSEGBoSg/vwSfOkLyQxQY6RlwDbQbRsHAAT39lMSSRD1gHtBL
r6KRHYTyvyEws6Pmf0NzM+PR/E8PIN/NAWEwvz1nzXfIgYfVQT7VX+CQ0uPPBU0eP+/MD/Xi
WuFketnm9c3W5dExeXJan888ND7/897riedPzfr9YnWV6+nX8d0W2/5u3Sb2etOb++/q3jLC
DH/Qf8/s6PVXDBoD5btRQAjo6Sfn55UU5efQsAgglP/NTTDqf1OT0fxPF4CU/68FZt82EGAv
sH8dfGdTwK72G9NUj0cv3LDRyVC7d+XmvT2CQtF5rjI3PYo0pf++C35curRV983B2GPvvj96
sPuHyOn/KnUPePVKJlnck5u7/PjbbClVnXlqhUJu72omuXSyf/zg/XnPuRtL2T6UXL5x/+vb
Vf8X/1mQMeWqr+2Dnt2884r+nf6bzlm75/8Uo2M2HOwxl/3///yXfjpp7x4R9w33TJ4u0Y6+
rama5WfHmZuyuK/h953lNU4nOzNatXqzRW9tPfDwY22mUPC0EMX0y14BfuHagW4PX5v3dGnq
Hl6RtN7jXsmuguRbdXEX4pVXLH2Vd2KmTovRuqpZc2PdVcRb7/a9m33COjbG87Vf2a2vOSnZ
Yj3ruSdpbS8v1T3lqbd/Fxfvzuglmltyfn93nhVb/KNikuP/lUt2sVzemrtY9+dt8zr/H463
JbTvzpXJO7buff2rLP9P8sVdP+v59ONZtFcyFbvaHc74o3vWbo7eufTuP39dZ53Ndy/gUbZq
0i8oYHjkFsXRyW9/69LnmjrD2WfzY7vCHa+uzM3qfb8utCvr5tWywv85By1aPkafufOv8Od1
p3y2uRuN/+t97v/8/h/Do/f/N1ec+C//9Ne7mQcDlFsEnDgUEcSW9H3Mp54vqR4te0fBKBgF
o2AUjIJRMApGwSgYBaNgFIyCUTAKRsEoGAWjYBSMglEwCkbBKBg5AABP4Xo2ACgAAA==

--Op27XXJsWz80g3oF
Content-Type: application/vnd.shana.informed.package
Content-Disposition: attachment; filename="kmod-udptunnel6_4.4.14-1_mips_34kc.ipk"
Content-Transfer-Encoding: base64

H4sIAAAAAAAAA9PTT0lNykzM003KzEssqmSgBTAAAjMTEzANBOg0EJgwGBqZG5uamZuaGxgx
GBgaGZsaMCgY0MQ1aKC0uCSxSEGBoSg/vwSfOkLyQxQY6RlwDbQbRsHAAT39lMSSRD1gHtBL
r6KRHYTyvyEws6Pmf0NzM+PR/E8PIN/NAWEwvz1nzXfIgYfVQT7VX+CQ0uPPBU0eP+/MD/Xi
WuFketnm9c3W5dExeXJan888ND7/897riedPzfr9YnWV6+nX8d0W2/5u3Sb2etOb++/q3jLC
DH/Qf8/s6PVXDBoD5btRQAjo6Sfn55UU5efQsAgglP/NTTDqf1OT0fxPF4CU/68FZt82EGAv
sH8dfGdTwK72G9NUb0cv3LDRiVO7d+XmvT2CQtF5rjI3PYo0pf++C35curRV983B2GPvvj96
sPuHyOn/KnUPePVKLlnck5u7/PjbbKmlOn6XLHiVy+18F19prvixtDIu/U0Qc8WuzDfvf5Vd
/R9YF2By6tUyuYJjd9nU5/wv+h/pJf/efmmPIf8hxutfLtfv+39zU4S+/lHBNea+li9PXSvz
6rRSnN9itinQ/UDtu2C7hU9ctjhNPbaV623Ugw8/9pl0anqvnrB5idCUy1e9pgT++MW7WGlh
qkToG9GTs/3E83xun+f+lc2yNeQur+Xk1oBjof6bN7/ueLJow+2LtcKVy7u1M++e9Ns9rzfn
bNPHUsdlp97GxnYXTTq9fp2T8zuxTC7d2//+GpxdJ/yjYpLj/5VLdrFc3pq7WPfnbfM6/x+O
tyW0786VyTu27n39qyz/T/LFXT/r+fTjWbRXMhW72h3O+JM7q9Yids55sZ+/uzPN9sseNOx5
wbHvwEHGDulMRRW7Pxmz5z3/3H0zp+510B6uVX65wdk15WuDQk6v29b9O537mGLP/aRn3/pP
7xerMn7RM/dn+cz6OfXf2QXq/88/6vzvv8b18vM8bVKKLQJOHAhioe1n2UnhH1tGy95RMApG
wSgYBaNgFIyCUTAKRsEoGAWjYBSMglEwCkbBKBgFo2AUjIJRMApGDgAAlX8+nAAoAAA=

--Op27XXJsWz80g3oF--

--ofZMSlrAVk9bLeVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXd9XcAAoJEL4B7CKgTi5GN54P/3XcD2OWQoczEuNiqEo4xMM1
D24Ytll+A1FkI+t/0HwgzkKVnDuDuNw/HYKQ9Vcap94ZRNgkwqMYlPRLAbQPsMvw
zen4D3zBJ+ZK6nSMk0xTmEbXOnHb3GPnB7UKTWt5NM+h8GL9FglxUKtpLjSYK2QP
qeIFaZkJca7nPdboNeZ4hlyjVHFV8EYvu3ycIiNPFR535b0fAh1yU168tdVPGk4n
mdjH7rDoJ1iNEdvQCq5OEwWlSfhSRbZJwFrEUgR40oIev2e/tzHauB0GFzVnTFA9
h+ch2PRpfNw6YEdV6gT1s1l0Qd/Ymtw+ost9MEHXfXHPqey68dAyRCpps+UvGkjb
RP4987RHEV8wpdWQGZmlts1irTbLHxzwZ61D72L8gYuE7Xw+yoV2fIUqWhhTpH6p
mPPGURg73uL/Bs8i4tk3NG/IHkQxb298iBgjtpTzxQWeEgGKzUNB+n8n3Cigojk9
WRZIhSszUHuRl2nGI0Xk3qKDEoYQJ9aVZzmgJI2u+N7ZBftsTk5hYDo4BuKLNhZQ
D7BJ2g9GFIZUILI0D3FXUM7liRaaYyj1hPtt/Og9YWsddZoNReMI5+eT25VQZx87
n5ZjklWiaMOhE96pV7Xq/5NghJh5vuoqdonEjEDddPK2EEsGYCmlAOFCRnRjwpTv
U/DOAslnIwBmk7n8Fn+S
=zOm1
-----END PGP SIGNATURE-----

--ofZMSlrAVk9bLeVm--
