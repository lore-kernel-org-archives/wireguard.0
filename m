Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C361CC04EBF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 13:51:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F5A206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 13:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="YiupLNKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F5A206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c233777;
	Mon, 3 Dec 2018 13:43:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 076cacc5
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 13:43:02 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e5b4a31
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
 References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=atEth7/ql/Mbfr8P1ecNX84vgi6mMStSiISl7O2b440=; b=YiupLNKLU3Hlc2W5DqlrtxwIA6
 bTdlylrJfd1H2AgHjkTn+FF+dTLKc0v/9f4K2pdagTam1rZ3prLP73+rcO6WK8TGRg6DyosE0ZWSX
 puqLXz8ANAUtyb041EYOx+JXRtdJuywLksyr1OCh9C6sktCD9XKZcpyNv96k1EAx1RDjnauZbddDZ
 LICNcXLTP/7Nd3lWI/Tassv19c2jLDL+2nRh27h40TWQFTXP/8fZclnSVIiQPQAe5o1YZbnnTbOpw
 Cv0dlLr3cCkgLCz29IKpCLlSiYSzHEV0dYYy5aecESwUdGsKyeiQNjJin9Xx67H3NKPYl709evSkG
 FFXIgd5Z2pHghshKWgVWrMZdDOp9D8bc+hlcJTAV9eImkz4PzoKTlpV3eS6EhBbcMJZzgMv34QCC+
 LS36YWvuolHykK67k9etGVVf7DdX5oxdoAn4DVzcbzpTAL10stnBannYrfwdeZgaNUMwKqE80GgrD
 kzE76xIUIgAw1veWJDUlGkXMUeLnW42AHueejU1IM/PdmrueBdZVN2ACLqBGEDYiuGBmbkCHH/sDP
 4KFPavqpK3Urni0P9ESdYNAvKBawViZrFpoMTfYpu3779rjG5qI9sW0uopBjedYBk8ZdA3Phaluhi
 s0lofXT7e7VzQCFpORLKzPv6NY6BhbSH01mFRBp8o=;
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.18.2.42])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>)
 id 1gTobm-000JzI-9Q; Mon, 03 Dec 2018 14:49:58 +0100
Subject: =?UTF-8?Q?Re=3a_Host_routes_=e2=80=93_ARP_on_wireguard_interfaces?=
 =?UTF-8?Q?=3f?=
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <8f102b9a-c476-24b7-c800-d4abdb4318d1@urlichs.de>
 <87h8fukb1d.fsf@toke.dk>
From: Matthias Urlichs <matthias@urlichs.de>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 mQINBE7uOWcBEADgsF3N8L9mUekI0XLfLNQpMLq9VMwi8nyZtmJECHOajfOX8tMWua1Bh4qh
 1XAY9cKsaHTd2Ik88I5pczS2HKIXq7d6Tusqwlh/8AwUw6i0Zo4zEG6QJemWKhatJK28C92G
 zIVQp8hHOIDU1nQ5jeNKGsYufTThey324Lp5kQcEnd9Qd07fXJtxReGHIT24j05jwbp0Sevr
 95sYShzSjGxwGNYff1oAhIrlfpTXFcVng/S33SktFIDHaGJf0FgCVCllhohFc7Ei5DKB+4cY
 e1iz4aydp9wiOCkxxMGRGUkTtpUI8Q6+RPl9Md48dKZAen1HxEOaY1S4DgAISFJoN2dgzeVS
 tcfQHe1fkGfX1TgDd8/wXTcjImj3JubDjD36He+sW9vkiEzh9jt+YfDoNiRslMXXCiMHOcTa
 FPHADf6tNxBQfI63dTVOLy03K5MqKz96joc9ULVXX01S2Cxr9v7JsThMsmTcfvMH8Frf2EtF
 E8J1o/69vNJa7Lowur4kuwzXSViUYK+dEEcpuBDx3c5z2F2XW2Fu7pghqMIHjCI/WS4HcOSz
 5wPvOI4Wsa+6hoFo4QMXGawh6qP1qzQ/UGPwKfry8CX7KQWVu2eszkaj8d6Hu8ZWYEkaFgeL
 539INuiRmj5tvUXEFWu12+b1NmxIBbIcwuF1/DYwy1keFiHSPQARAQABtDZNYXR0aGlhcyBV
 cmxpY2hzIChwcmltYXJ5IGVtYWlsKSA8bWF0dGhpYXNAdXJsaWNocy5kZT6JAlgEEwECAEIC
 GwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEEr9eXgvO67AILKKGfcs+OXiW0wpMF
 AlrMWRYFCQ2/Uy8ACgkQcs+OXiW0wpPvfBAAnzPgDruNK+sT2IAkipoHcXTLH2Kdqcxe79uK
 Jr0KLrMu81UKhZDYS8Zh+lqwT/Sea+CDe55JW8gjyH+RakmTaVDsjT4NCmH04qMeiyd/V1Vb
 Voa18UsugQhfYocQncZC0n7NeX2VJSXKrk9mZm8Jo7RWWMGCVDHGlsaNNFswsjGXxDyJVoHc
 jQABwZo0bwclc9EEAJR5PoJmv7IFQ2RQfGubF/FkqXpQC0CL9IOEddSJlvRIgVPRnvs/pd86
 ZDXicxs9ZxANHuyvZ79JHp3feKD0cVQKcRGCyDacEh0M9Xw+sdNkaTZkGmb+VprRgLly5BMN
 TZvmsUXZ6090xf0guZe59wv8r6BhtgN703NKkgeW33MNog2g4Wzz+LHpOsXoQCJ2wA1AF8xk
 YCGpzbtDV0vx/0zJUFLt7LE97DGl8mY7oDq+ADn9XIK7eh2CPMjLex8YMnFEE6JV6dX3b6Bk
 te35ZzToZSer3iLM8LkfCIJC8m9km3BNdw2wKWPIMD2lvOeGNNX5Q26Gt4w4ASlynTwdE1oh
 hiLQqPQ8SpxIfbJ5mx8QusnrBqfR3LjG9IwxpvF0jLQlM8lzgAiJ0utSZ65nIZlVSQ1aYu8y
 AaRRY1XN7ODKb3F1Gvx2WIc935KrpB5Cp+gTsRhbmh1tL9FlAijplToYez2PgU2f6Bz08du5
 Ag0ETu45ZwEQANU6lovLS4saxgXEUKAXKqrLVTmbrPg4SlR8vT9tGOU/pUsJ9uRXHHenksRx
 1OXE/uZKOd+ldNOURWUqEllJzBwtylGIicbR63RtdAuuqLFy6onTh/b0QMxafWImFUnI/Ohm
 UXo2CxQOKPjQYalgWD0dyrY8qzYcfPidCjqmv4VK4RVaL++PHqGFLiaH6YXWazPPWKhF5HHP
 1M8pybSZSWjaTiqLXcqJRWZlZffzLrV1WYboLQ2kFU87dkaTwn4StKn5ApUc58rCYMG4gkJb
 7UTQQQF0doibEYlGlz9BumuzLe8xm2lyZJV7Sak/20e3j2fu0XMqdrEAsMXmhFZ4yCXoLrlu
 AVcLgVeuAFqOnhYhW6f2i1YJJ5TjqbvomlFAckKndU4uS6nFWv6Z7IcwUcoZ5UOjhSRDioI3
 XnBcpRWm+h1F+ga26UCxyoueMLIT3GXhAcErrx7QQEZVJZP0FtXEECim1+9iU05HGJkYrGu+
 C8NbCURIBH5Ixzt/7tJT822QzXmTmQqmbe3J3xUMnKS/tBRI83jgP1aqvrw75j/xTR3KkSXP
 8bqw9LuBBoTcH1De408XfPkcM0m/5BUrIjRCO+ScfV29Ew/iPy8vUQ8BbRFRCcKMsWNhpr3h
 zXCaoFBe/YGNIRj95MKmCbUuFJOpHRLYOwfnEOKvz9nbA/LjABEBAAGJAjwEGAECACYCGwwW
 IQSv15eC87rsAgsooZ9yz45eJbTCkwUCWsxZGAUJDb9TMQAKCRByz45eJbTCk9QcEADAj4ue
 JzcXLsrXkfsv5aJDoNDGt7hddmWtWLi1V0mmPiUWjolj27d3xVPLomlPZtMoMG+w/I0uB1ob
 Kr1KzoRUh882BNdC1gwdOnLc9Vwh5bIL293fEN4h4lKoqB2qvJzVDnbBHCRSs+q5HXVozgpI
 eTdKlwNo4K1/8IQ0CdViJlX0eVoO1nICrJ8FB5uyE/uEftGnr1fYcA6UWiqSm1fmIpadDecx
 IsgJuv5evhhRamBzvf+jD8u861v3ZqeLz5CN9O1oVlv1L5fuqLS/detuDb/sE/uc/9g9WcZF
 JjvQoArlT19b7N49DeRnsjIL4UwCh5kkl9I8714Adv94qdHKEmmA7hl5PqaOhaEUUcUMjcWr
 tzKNbczN/Ka2T6f/RNTri/xbRX5pR4woUZb/AHvB6oJQMZrGRiKlUzSIQXYCQNKdIFbGLp92
 LvAxq1r/3DKhg/BRbogbXgpwhBXelR9Eg4zQxA7nqZ74vjN2RffTvRXB4upFr7oOSP2kBTfx
 YALrEWgvodhYdpLwhUWlULHkaxcwYsqLEw98yfalhK7x/q4lE7I1HoSRQ6otwXKaot2VBBZP
 A+Tw/UuvK6/UBlqWo5nGcPNJU6A6hnWBqOdAkBOQYETEw7xDSYf9hkzplMEUIEd3MXTS5bB+
 uhUV4tfLAz+qvFOQqyJgpoO3VUG1QLkCDQRTP6WIARAAtKsIn5Rjow4QOgZ/EVIoMld0F6sP
 msGYqZNW4wM1gDKaSLAuQlD1RZEg4lx/w9y2BZhVWKHzFJOk46xqjZquCqV1QHLDtjFbTb/E
 Cf4YlzXOeAb6O2/Gi/DQCfe543oYjn5AAREAcE/1E2W1ZzQufbGD4w5YW9rBVItweIRHIVfY
 dTqTaBZkCAWlD+Xc2hOKORif41FCmfuAy3PwwSbS2McQ3XuF6lljNG3+h1dmf1V2jHa29gsh
 CL8Npm7aMSvsLE89nfq3B1KdxrzMaLeNffH+i0O+fwg8EMLW7It1t0RjEv1ajPAZQKWb651s
 REuKrgcCa8LT+VnkekyXJexbzo1Zadt2jT+TrV9J2Z1FyBONhvi7H++b0SANmSeoysnlfYmU
 MwUu5prb6vimnz+wBKC4whjhXhAVOXItrLBR+Npmz5wg4g4y9m7hrV3uaDfL8LvPYcfYNRBj
 8akl6Pg3z60YJZN229gn9/c9DeeuvJ6N2fGdBDYygN1GCP4hbhBoESngBond2yFUFE3jiRFE
 4oxezePcQxpDNv262RsfxCt34WNZodmxzQ5aValF9hgLC8X8Woy1mVPoENrwUVvwfilrGa3N
 /rcqEeuWMJf8BPj+9LLNXglekYCHHkP8jLfrJBuJbfvOzNBIwTvOnH/K0VmaLgEjLyY5IpKF
 7X3LFA8AEQEAAYkEWwQYAQIAJgIbAhYhBK/Xl4LzuuwCCyihn3LPjl4ltMKTBQJazFkZBQkJ
 becRAinBXSAEGQECAAYFAlM/pYgACgkQBsCEUtiHyJakQxAArKa0nKtSCkjBzRwL2vWY7z6B
 2OdA39WPbmSOxsH/IMNlsXap6bjRuSkadbfL90pYT8Tmg/22lgYw/B8+kcCTzQqvqMOEg3Nz
 A00/fMr42Zbx3JF9pJ/upVce1dbiPVOIJMDyZh8jrnfzsUAhIo8qDypk8cdfOKhsY+Y7rn/A
 RpzeBtQB+pHmEQ+7qVxEJ+oJzsNo9suwW0KK97vIGLbR+8x4MXViUXOQ3jqtgyNT/OfSdOJ+
 AjrwtquxXBr3xyW78OzqR5iEfJLwOKZZjnHPKoTftgaj2xcCe2SXxEVhtlylPtbCeXwQqQY8
 PDDJ5c9c0BJB24K6d1h5FMk1elMen3go7fIYOs5FtGN+rS7Vt4whJk1mCRKmBbwFiChMAgaN
 WkpJCA+AcfwEqr4sbkJHfGJ7z7gPmjlW8xsrzJLw2tfCl49bnIHaCSNcH6UavYsfz8X+y3Df
 kyJiSLg58aOXDvhU2bE7TiUl5zhbJ8yqeUtBVn2Rvx6Y730UdcxQDYhbwINoZzO3EXHSvlFf
 EeiHmizt5HF8qHrlay5gLjn7H3QvAsHCVCVT8s5ojB59iE1dLdeeB4ISj0EzG1PZsVdNqxbT
 WM6rIGhXOXXvwaqquDFufo6jBUDzfOAIwGkOCaqXJhIK/q8r08XmkwzadaT7PA+8tosVz01A
 lLvMmUybQ0sJEHLPjl4ltMKTMI4P/jJSUwAz0TjigaQRpA7STQ+c/mTHG1ih2Ht+LiULhOJi
 vHbJd30gsF3JQ03/W0Lmj5uxI0tyw2jj7YEBwRQgpMCky+4hz8S8/rl9Cj18Z5kI5pqYr/Vv
 iz0Z2GvT71qBEz/kHXNpfdG98wz9N+RhvfUt9Apo5p1CIGNCbwcmc2vHjQgqojnVwBeOgq6+
 utZSEJjzkfwNZ1YJ08xJXWI5BbP5DeXnCj9yZRqck3yJcMrp123eqASE2Wfp2qGaefTZDltm
 iFkgC7H3xFhvn2EWQKjc7VEa1EiygEkLGr/MaG4RBAfoJECDWscCR+QzkW8YclgFRUjlnmVR
 lLkjPAqSPIIMs8xH8LdW4cbsahJg8sy5j6eXgeKhaY+4RZhBc3dhDxeRn6g8Zz+tK4m6WcAR
 ksiTXlv85AhYSj+k54oaO0oyh6HDDIZnDpvmn34lra2RApKitb+JgVMLhBWv3MTTQg0j5B04
 d40M4/o16rUdm3AUk/D99BroSuFuYA57GTM7NbzOKUN3Bd0pYOBqd+yKe8q1jldqOm8gBOXu
 geJJTd3zxRqqub8vD1793GLv+ejvt9Fpyo3N9EsA2cyhVLzQbu8zGBQOVrFhkcAEsC9Dddmo
 QYQFhrzf7ehzInvllxM3fgPaMxmerNrzlFYkDKc4QYc04IcOwz+xmsOJssYSA8X9
Message-ID: <428b91e9-f3a1-c385-4663-79dcb74dc7f3@urlichs.de>
Date: Mon, 3 Dec 2018 14:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <87h8fukb1d.fsf@toke.dk>
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8027889748736763883=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8027889748736763883==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="7TbOFRXzJ5drvE1lIhXFbUl6vZ1zb9iAC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7TbOFRXzJ5drvE1lIhXFbUl6vZ1zb9iAC
Content-Type: multipart/mixed; boundary="OHI0DiSfPuHCJalwtDAfi9bqMzhGDBKYd";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <428b91e9-f3a1-c385-4663-79dcb74dc7f3@urlichs.de>
Subject: =?UTF-8?Q?Re=3a_Host_routes_=e2=80=93_ARP_on_wireguard_interfaces?=
 =?UTF-8?Q?=3f?=
References: <8f102b9a-c476-24b7-c800-d4abdb4318d1@urlichs.de>
 <87h8fukb1d.fsf@toke.dk>
In-Reply-To: <87h8fukb1d.fsf@toke.dk>

--OHI0DiSfPuHCJalwtDAfi9bqMzhGDBKYd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-CH

On 03.12.18 14:14, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> I'm not sure I quite understand what it is you are trying to achieve;
> why can't just you reconfigure the wireguard interface to route the IP
> to the right peer?

Because that (a) requires a new mechanism and (b) requires locking,
because currently you can't atomically remove/add an address from/to a pe=
er.

For a "normal" interface I'd change the host route to whatever the
nexthop to the real destination address is, and I'm *done*. That's one
atomic "ip route replace" command (or its netlink equivalent). I've
found a couple of HA management programs which can do that.

For a wireguard interface I need to find the correct peer (by matching
the real destination against all Allowed-IP entries), lock the peer
against changes, read the Allowed-IP list, add the multihomed address,
and write the list back. Before/after I do all of this I have to remove
the multihomed address from whatever peer it was previously set to, so
there's an indeterminate time during which the destination is either
unreachable or random. The aforementioned HA managers have no idea what
wireguard is, and their authors may or may not be interested in
special-casing a still-somewhat-obscure network interface type.

--=20
-- Matthias Urlichs



--OHI0DiSfPuHCJalwtDAfi9bqMzhGDBKYd--

--7TbOFRXzJ5drvE1lIhXFbUl6vZ1zb9iAC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEe156i1ZztbbthlARBsCEUtiHyJYFAlwFNIUACgkQBsCEUtiH
yJbLTA//cTXOL6tQdy4vx/jwF5n7JB/EgLUBWzNitTULRrS1lo18jd8bfsbWc/a1
naJt7vzYO6vkzip31qFKOoK1jLybm300YbgJuscLr+9qAoA1Le5Otz73jht6wpgx
HJ5qSOz7HU5TrV4PsV2qizotWBPv9m0V9AOUyNc7xOv1vFzJE5rtIGk2vKIxUCuG
vRllxmSL/o1IQLNKfDIuKuz85YccUvfQI/KwzwMMg0v2Y6SEhIrToTqXGs11oJ/f
7y1pv3T+652LK5c+9uxzILt710s14UjBou7hGNrpboGJGCswLU9prkMgXO9RUYea
G0ZoIQs/qJvP4iZ9IroeUPSKxAakmtrmq+UUm/c/+OTeYhWwzc7Sy6cA4GIFr9mx
8Z8z+ptbPMRlVsYP+/LgcCoy5uv82cAoTVefGy6ohHx4qXq3YcddKC9vtD8zHmWn
Oh2ddgFfSW8+aIJSHGxu+Q8lGVr94jQrsfg3mq1T85/QT0HXJeS0IfRx+bp2TMPg
X88KVO3r0r4BcolOcP+2iQP+/Lqkw5hb13ydjTLMQG3iHfLZyN5qn135gVMZOYO3
WiAK7cb0aBGbn7KV9vIJ/bL0zZohvfXdgsCLWDUPmdzcGa8Iwmqb9zPZKzrZR20b
d+PS5RElEIYjikb3iUyLI53NZYvyvBgjjGro+VjDY7DvGBrmDzM=
=u2MR
-----END PGP SIGNATURE-----

--7TbOFRXzJ5drvE1lIhXFbUl6vZ1zb9iAC--

--===============8027889748736763883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8027889748736763883==--
