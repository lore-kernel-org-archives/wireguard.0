Return-Path: <SRS0=sOGU=ER=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97672C388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 09:50:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D25820637
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 09:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="DqLXC+Ms"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D25820637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69237124;
	Wed, 11 Nov 2020 09:46:56 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7d1b166c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Nov 2020 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605088240;
 bh=3RTcZAMJI3hdbkzeu21bb04fX9vyYftL7SC4vA8yWcM=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=DqLXC+Ms9ekQhdmgO2X8yHs+P1X6WqE7c5Kafv9tjMuLMLmhn/BbUvVCxp91BaMlP
 5QUbmLINIO8FG7eF3TznTOC9CnH/061fYRmBItMvrCoKSmb736jD8T6JwFFrHxFInh
 34QaCcshKsbp7vSSydofnENgG6SXLLEfc5YIgKnU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.34] ([77.21.105.134]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MaHSb-1kqpVN1Hwj-00WETb; Wed, 11
 Nov 2020 10:50:40 +0100
Subject: Re: Actual plans for Windows client: PostUp/PreDown possible?
To: Simon Rozman <simon@rozman.si>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <b2a38e9f-9e79-b821-b80c-4cff284f8f6b@web.de>
 <B14F0F93-B5E5-4224-A49B-F53E7A4B105B@rozman.si>
From: Stefan Puch <s.puch@web.de>
Autocrypt: addr=s.puch@web.de; prefer-encrypt=mutual; keydata=
 mQINBFHLAR8BEADbbhLjSpY+pc+hWuQuwrisfoDrnxVfI4A+egjZ0RFF8hkBci83XeBj8IQH
 /Ix2ZCUPkL5RDN+I1Ji3aY9NYLfE8QvQBC+WoDivfMh1ajH8RUV9B/vnbNcxERJRB+iT+RTY
 P7QSPEb+lUK7g1GAsNs05uhfTUh00qri777b6sL28xCdeNTS9LNXTX7pc0G3AdmPjpmc5q1N
 M2lzcZrJCH1cYc+kgC41fcluQ0+rSFQgUzzzZtGj5MY3KXZZWR1hgmIOAZ+RtUFlHMllvBFt
 sw2cQEnewxc/LShb+/GsJghuucNN52aydsBxLx+1XRX5sCFa8x1EHqTJZtyU5oqie+xDgG2w
 LbFBlfmz/akjQlVkCwpxrTH6AOGVi36qZngyoZG60yRmWhU1U/UFD4v9p76asQD6PL/TfV0r
 rciGoFlEzUQ58gEhE/6Zp0W55jzZ6xbb5aklAgArFesFtEx6B1KbSE/SLwvyM/Mn9Sgbdd6c
 5D2g4NT7X9JYujswKHmP/ekmrBvkt2ewyajiU0WFhBpCr8XBtLEv+NX8YgIMsn+PIqV4J5On
 fhbsmCF78wmMidrnx8XjQAtKBzeGtj58Lk9yKW3imcNasxppCAFM3HkE4X1FECu61QZfUGKK
 WhfXt28lXLdNN+B4T0+LnRUi6tmbDtki6wy+IJ0cix0qz9q01QARAQABtBtTdGVmYW4gUHVj
 aCA8cy5wdWNoQHdlYi5kZT6JAjcEEwEIACEFAlHLAm0CGwMFCwkIBwMFFQoJCAsFFgIDAQAC
 HgECF4AACgkQZZ/tO6s+Dv1Y7g//VSlT+7fslDR5EH/ypk0Cc2MF+bA85gOaOiUzev+Ztnb8
 YskMkn9JcFZuf1jqO1+x4/RFaAStsFadKTVIy+8zJPrbviPR/bGwFdCQMnI/i7IYXCSP6hO2
 0FaO4nPn+Dw0MKLfxkmjzZfBfzh78bFUTOenqQH8sJbhuxOruiPrc0IRTtNeauwSh6NqNf1m
 iZOAfLSnjpzm6XW+8xsCU9OdDrXEzDyfj/h08Z+dRru2DbMYXZGIoWkhHBFXQcP4MQpd4VfE
 037jj7945YW1g8v8iRww37nHCitkzaFa+oyQQsvDr0/nc2HEzxeCAk/P3581CdzXuX6/3TUY
 Fcx/e1VJCp7xm6m1oY03YdGiMg9b4+FcJrip2LEa+jCNd39IHuAVDBJILxvG/H+kVop7+yXc
 4EDKgAiINNvh1uAtRqFxATNJ8b0XGzmO7FxVhxF+hh8DQxoGkOwNKz/UA6GS1HiKS7cnDQx4
 nB8Z8aMzWahoteK+bh2MwJYYBVk/nl2luoe3oSTptTQfGltSDXjsvmzshy4jcO+++mJ3xvx2
 zUNTp++M4P4Kgyt6MyhcP081a9UxUxzPv1uNpvGu1AIFL5m1+4vePAldZQLq0jmbXMedY1vG
 /9bKSaYfFy4iMlwNrAELUtoNFUL5av/NGvaKLXilxgFr1A+Ek8FBj09SuVUykjy5Ag0EUcsB
 HwEQAJZVvCVC3mtIIiw2ZhleuY/8ldOUhD/f4pFmRtp990W04MDI+gJySELrSJtef/VlBHdM
 kgYhnSsXthlqiT2AhHnW7GsFv7JTCdWz/5+hCBnawOgF2KSpSzTslInrwDemRl7m9SWv2wHV
 RfqTiDCQVMvPzGYPinNCW3OX7WqiWmznMAtKpiIdPVXmLWET4xGXi/xrAkEmp8e/OgRzG9vo
 f/7Pnxlp9vM1gVCQyIMmHyb2Qn0ZHfwRB+ISOQgdQognOmkDasvfz4yYjETm1+ZlF8TVLCll
 EmckHjdkObAfl7socwSZylFi3yDglg39IU2Y2PIts4d/AsOJoQZSt+uvEMsmc2eeNZINX2xd
 zZnKm1u+LPI6KYM18jgD58nTQpzcBxrfpjDVwzVLUQuUyOF5U1SzUYDg64Hya8BoHWifvaWz
 mv0F3J/BCboJU0nXPfOi+jZk64O6MW6KX09Gu0WNYMIlj6raz/nBOQkFQHWEi99LXCItEFHI
 hh5Wh8LpduDbgXKgti3h8mE/TdXcuYryedMWQWTmArooAjj9hDvhwJTEfEFEvCqFPbi0ZhOL
 IbOoByFXlM3gMn3FFEWGCOOLOAVjQpdAJNDT1QcnkuVCG0Jv/crDb6AkWqAJFlmDJqOVtrqT
 j3aDGq8yURXezLiwlQ/FLhf1KAOIy8j0YTVRKrnlABEBAAGJAh8EGAEIAAkFAlHLAR8CGwwA
 CgkQZZ/tO6s+Dv0F0w/9FtEK9yx0b337CeVL4ye2tIqvagePJlGN+nHtjjzS+CPDeAJeXmRI
 Ndaai9F7FNyWP7IC+Lp83Tx3lQHq8BsEVZwe8Dv2IRouRu8Oupx/tIE9DiCriG4ueWYNqs/E
 gAa6HHDEG3EJanLf1SAFYFU55dbmAt1mEOBln8G0k3lbJ1Mcp/dQnXs0NQ7kkAZecOHq3l5L
 9lzcEtB7xqb6fUq374JAlc+i3j/Ep+ft1O+idBarkoLSYYz4/SaQF/edYThQ91pRfCN7dhzk
 vuJdiIzjguOzGjITWVw6a3+wMgL01dbVSwh+RATkEucDTyJEjDpsynpI33CeC2DX7+BsH7jW
 lP7XaSlq9TuA6m1fl85GusyLQSMPx/ICGiy+/DS4WyX7zgrLa37W/AbZAve9uQQEvUXy3Dc1
 6528vnxkKNuKM9ERbEW7W/witWlm2YSzDpr1ixNpItfuqo7g02/GiT1YoFVhjI8M8DqN3kDk
 ae1IVgFoJkdsY0MMAtgZcfBlOB82jRopOzrnDO56dTEb4yMIQ1IcOopHoGJE9vzyp8eAXfvb
 aE2JD2olrYpcL6IrcTyRKRxLB4jRlF+dVqk+2g72/FXsp8AFUB7Nb4f/5/9DvjMa4rvHOIKj
 UtxlDUJbTegwlzcMd/i8fgPEzztG/KOhzonpaHrWe5/Ay6KKITkKkGI=
Message-ID: <b75d1ae6-9c37-99ec-1ef2-1166df108be6@web.de>
Date: Wed, 11 Nov 2020 10:50:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <B14F0F93-B5E5-4224-A49B-F53E7A4B105B@rozman.si>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1://4tRiqL3EqHryMro5uDqm8RECRIu/huBR3W71LO90rivOhop1m
 ovwJGj0ai1TxE4ijj7pX1fdOyIxQAbTQg+ixvw5Bi8VoZ4h51BQHKsLuPkw3xJ7vwo00IGb
 V2ITB6MAc+2+Pye2BXd4gfmHyL9Ffi6wpHcjdD4HzewLHdR18kznJ4gsNsrkpsqaFp2HqDb
 V9dojxImu+3rt+nXlGdBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cAxqiWxg1JE=:wkzNZG5SSvHxFxZZih2kuq
 l4iN8SzVfMNHlIQNcCWpE1arc6dEg3jW4/LA7umSelpOZ83yLgwHypqjWyaT3KYYYujgiddFG
 LJqJ9GHNhYYeTIXBEtLzGzlulHZOPVosiCMHMcnoQmhAPDSnxJxivmrgokLlMbVuaijC1593R
 HCavpMq/0BiCn+P6IjoQ2+ee7U8HgW43lNnzXh45b9JnfX34/+5QBXaBy4cX4hi4Zrvj2oVdC
 WPLndLjL7cMUZlJzFDa4rdyjdFwVI5AztxLYUw6U8bVEQ0LnspOThH9nMUCQYTITsDHj8hxLE
 yP0vTAy4MypE3yTbQzZHDVkQ09mA9ZmZwwm0qqVop1dl7U9w7wwPJX8H1yQGyWKxJ/xfFW9Yj
 /R/KmPuSmpc+voQJCtstCtUhio2cZidZnhvG1JqOLke8epah9HTmMrzt++pEJrXl0We8pJ8OZ
 DbxFnH3pB80N+r6CDamBlfecyoSRnnVp2dl7nqdMjXIUOs528P86HZvA85HRWB6I2F+2xGTiY
 SdGmy3Pl1bDj91ZgGCjYlTFBi0XhMt4xP8q+HsME4UiQzrH1W4iQ3RSqo31FaYRobW3SLjlXC
 l77j60840Bk4St1h4o2gp8ZutybnhjDrAOEanq00bkVOGPEKjFqif2MF6C0x5g5B9TfCk1NnE
 +GTmoitDL0o8YRLHifnqMS7hU7hZVkNn4Vx/B6gxp9TFGMtl+OMhkiqQXvTPNzGhLSsiECWFO
 CHoicMJeKS1yLGye0fV2o0gubYObma78LrTjVWm8vm52CzsnuvXc55gfTPuGjkrASpCjJJ1Zo
 /xG0g2iVih+cPdifENIAQ2v1+zHMNQQWpL3Fpk/kVc5D81eFH0Z+Y8h9uBM2qpEh3nC57GTk3
 HBSd6HkZ5GB0nzJ8PF8Q==
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi, thanks for stepping in.

While I like your suggested "always-on" solution for fixed desktop PCs I d=
on't
like the "work-around" for client laptops. A Task Scheduler which is tryin=
g
every 3 minute to set a wiregurad tunnel when you are sitting in a train u=
sing a
mobile connecting is nothing I'd like to see. I think there are also other
scenarios where you just want to "click Connect button" on demand. E.g. wh=
en
your company has multiple locations and you don't want (or cannot) use mul=
tiple
VPN connections a the same time you will always have the "somewhat broken"
network drives in the windows explorer too, since they weren't disconnecte=
d
within a PreDown script.

Another problem (which I skipped so far) is related in point 4. of your
suggestion and as I see this a also discussed within another thread here o=
n the
mailinglist. While a simple network drive can of cause be setp to a fixed =
IP
adress to drive z: using fixed adresse is IMHO not a good solution.
Like Yves Goergen pointed out in the thread "Add local DNS forwarder to Wi=
ndows
client" I'd like an option to add the remote DNS server to the serach list=
 so
that that I don't have to keep IP adresses in mind. But I think this discu=
ssion
should be shifted to the other thread.

Kind regards
Stefan

Am 11.11.2020 um 06:45 schrieb Simon Rozman:
> Hi!
>
> WireGuard for Windows and OpenVPN are fundamentally different. Consider =
WireGuard on Windows as an "always-on" VPN. Once configured by admin, it i=
s just always there, and users don't need to explicitly connect or disconn=
ect. Trust me, this is something your users will grow to love - no searchi=
ng for a GUI to click Connect button when all you want is to quickly view =
a business document on Z:.
>
> Think differently.
>
> These are my recommendations for your use-case:
>
> 1. Configure the WireGuard tunnel at the company endpoint. Use specific =
port rather than random.
>
> 2. Configure WireGuard tunnel on client computers and leave it active at=
 all times.
>
> 3. Instruct users to connect \\10.0.0.1\data as the network drive Z: and=
 choose Reconnect on logon to make it persistent. (I am pushing a logon-sc=
ript to do it in my deployment.) Why users? Because, seldomly users discon=
nect the network drive by accident, and it pays off they know how to recon=
nect it.
>
> 4. Don't add DNS line to the WireGuard tunnel config. Otherwise, WireGua=
rd blocks all other DNS servers and users will not be able to access their=
 home LAN by hostnames.
>
> 5. On client laptops that roam in and out of the network where your comp=
any endpoint resides, the tunnel company endpoint will auto-switch from pu=
blic IP to local IP. Then you put your laptop to sleep and go home. When r=
esuming at home, the WireGuard tunnel will still try to contact the compan=
y endpoint by local IP and the tunnel traffic will stall.
>
> To mitigate this, I make a task in Task Scheduler to run "wg.exe set <yo=
ur tunnel name> peer <company endpoint pubkey> endpoint <company endpoint =
public IP>:<company endpoint port>" command every 3 minutes.
>
> This resets the tunnel endpoint to its public IP. The tunnel traffic is =
restored after leaving company network in no later than 3 minutes. The cli=
ent endpoint roaming is handled by WireGuard.
>
> As this scheduled task is the same for all clients, once configured and =
tested, it can be exported and imported on other computers (I deploy it us=
ing Group Policy).
>
>
> And that's about it. Your users will always have their Z: drive there. N=
o need for PostUp/PreDown.
>
> Best regards,
> Simon
