Return-Path: <SRS0=ifwh=XT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D549AC4320D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:56:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79EFD205F4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="pcWgM55Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79EFD205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08c220f5;
	Tue, 24 Sep 2019 08:55:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c23df64
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Sep 2019 18:47:18 +0000 (UTC)
Received: from sonic309-14.consmr.mail.bf2.yahoo.com
 (sonic309-14.consmr.mail.bf2.yahoo.com [74.6.129.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2e06093
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Sep 2019 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1568659638; bh=aQJR5W286xIKYr/h6NYAgXfcp3SBWtRUnFusU0HtdGQ=;
 h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
 b=pcWgM55Q6Pkm+pM+vAVipx7qetMqWuvsBtL8bi7SdZP1Uiv/kuUdg/HPyq7xTWLQO2uV9c2jTvIY6zfZtEgfkk+FbOZhRzikT1ESJ3QOHZ7T/AfH55XTyc83hbKOZaj8fbaA68uPlW0SlMEIXR4RL0EX/qo6HfWq/E9yArENiVHPeCf9+FsyC6SHyc7/ViHTY+pdlA98lnmGSiz8UhIg8BKFyptX/DXhj6R21AjkfF2plfcU3esTOKZIHTCYObnPCIU0O6BzmDZzHFR+yQBUyM5bKigs8XgGp27iLiZ9+KN1uXwOyBzni8nA6MIkCmrcetTPH9+omsE/TAw8HVf1zQ==
X-YMail-OSG: q3tx4J0VM1n8tfWoFzwG6Ds1zajL_Pm7xpQB3elD2XC16BZvFaON8EwC8iiV2jP
 so2bS_LLtVyaS55JAYAdMLJitH7jIDSSM8KEQaUATwYkcgyOQSG0i_UdcB9h2_ps29HDTUIIgfM_
 nviTgXNUN_J.X0DwrQXTJqmdf2w20FOfLNL0EMFBUjJwo30Ylhy5pL3IDnCRH9QIetUjw2nxrc5v
 54pdiW.Sr5.NidXzBl82OuKGXv.Fu7IINvx.9qUs4kqFIQZqvtqpP9s4PaBQCUXPyDGhXuDcPaTm
 un4Z1WgovU4XzKJHGrS_jdVvFbuWTV.518nSzI.pOmSU981RHH.5kIm3R4o0KodRVps.wAgjpsGj
 WDSGAw0JJYp0B9jcAA1Iq00eXlGR79gWp5HZneuCJa5E43R1L6k_ES5zxrY7ssOdUbsOhKqXW2IU
 4HQxbTW2o8Pw90ZuzSaVsnJ_Ckt1yMTfGSG2E.M.RuEzQow4WxdmMQxi..xNRZ8mUOUo5AiawYZq
 lY3kyBMRfko12nLMlxbpEy_g_LoTtNjbfNwvgWWau1tQ_VLOkmKDcX5B.ubxKwKMBmIwKCLC3azt
 5EJPjoxwNUmo7dW3ySYfY99jGUWFPP1BOaap_wdAh7sBL33G.TD.M_O.0sy1Dq5cHyGhu2PIVu93
 0KdK.sopbyPVC7ZyDPPbjQNdBgiHco0vGLose53Stg_HGo5PfW1abTF__VFTV93bYwu6entjoDMT
 zTWnI.0ppul1o9sac2Bv5aGNsUizNXgxhJD8Ps8BdZ_a.CrTjmFVsYH1v6E40aoj7KabMBo02FdH
 47tHKqVusxyeRPlI3ShVfCxId8JzeSxc2bi3j0d.ziSncV3KZEf2xMz5AxYOw.okNLAo.DtvbIGH
 9AIQTt3bZbSS3YK8.LWo7fVjTfYTM43NHJvi0tlGjF5sNyH1Z6H0w7lFb8V5UH40jk336GOBrz_0
 Rs.ULtc4NS4rNdLVcBMKl9cmly1eXGuvDl0RJj5S1ur7rNvaNDzwSZlYolzsayP3lpMWPOc1C9hf
 ehxMH5pIASsu2bR5NP9fqvHKipPvVI4jcoSU6geTdbViHXLv.zzRA6n9igXL.UaHGalePXcnX5Wx
 TE_wY5Rdfg1cr6gAR1mahvjt5L_ywkbWuFza7tLMqFr9cwMLWKV4bOVXnFzCnQ4cLo4Y72Ld_Zto
 20xry6ljZm5E_D89qmdiaKPW3JgXC4xw_9M990zF54jNFpjdLhTgc6lqBXhYjGPA_AGo3QmhXjqK
 w9tyRnCFmbzICLe5qljvm.uM5mTNAtGqwzj9ybkj6mEYYPcCq.tnlXoQ.HP8LlIuraoOiEGU7Xnq
 GLam1EipxqaxAdLfYjyc4ZSeiNiQJ6XtQS0fgTQWZq7PSjgtTdAWiMoe6Cw--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.bf2.yahoo.com with HTTP; Mon, 16 Sep 2019 18:47:18 +0000
Received: by smtp412.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID b4e34f25a5a47fbe49e88fd3144c8518; 
 Mon, 16 Sep 2019 18:47:16 +0000 (UTC)
X-YMail-OSG: xw_WsL8VM1nyIlHQBZi4yOXTI3G36ar4VJX_ZATzoZqqbV9taCMZvinC5Ygh.0V
 78zL6p_rC.Lrheemiv8oeeyOgDE2NJksPrGBgkQDgx9n_pilqJNPEkiC0X.EFr7jQk4sqiOL81UH
 LVLtXGrE9sbvIcFEeStqPIFJn2UUuyTXO2akhZDQGnND4QN89RBnCT9Dikvo0m7bOZMXal.RjoRh
 .cE_Jv91301IkeOTgHq8yyHqCAldxewfcQKv1yxTe_8KCZ7AkhXQVUAvNDiIH25I89sJlV.bGY_.
 73wucczGhE8d4QE3JSkfvwsC0sP6e1EP3WvQU5QaFGn7dw9ndV_tgJt_zqTUuPjJYBLJMtoOZi5F
 aPBIAH3wtjBbxxlEwXW.DAT7tGRHarWdLQTVFBP5qU13I.SrxNuepD7dG5bgNA1mYKBdcN1NrpTG
 56FYvgImS3jQGcrImYabiMR0Be_Gc8gUYI9sFY8GJjcT9EyogFYa0SkD.mL5scK.KVtqH5Ur47rt
 yzi3uRSXlfgMJuyWH0OedCelGvJ5UFi_HWHFHL.zJhoc9x604o0zh8ck9O4CZQK7yMh_dPPU0ZaG
 cbF2iL1_U57hxK1rY0.2EHyuHclFg0CG9y2QnKakP78PCVYU3MpV1Ax.3svc3Vicl.q0lTdZxkKl
 RD9joFg_89bAF1xR7xcPCQr17uDs9q3RKixCX4fOVmpjrU8U758iqRg5MRfV2vAVmgJGHFfBWkg3
 1jn67ziT4IzWdOQcqwQb6qyc70B7Ib1EtJ8VDHYPzdShI6sqGHEqXDdyrmG9yRlE.df9GWJQEvhl
 oGnk7jdg0TKwGyk2EizYw2KHxIlQk0dBQQCGwsjhBmtvdJEUmO5EGRU9LhO1up.wA9Mx1Il689LM
 YZevk3QZJ_TwLesdeIxE4EC5bAQdy4vA37jU3KSuuFh0wFLIttAxiuXkfJiNze4Ghm.QN2IwuwOU
 ZMZCfPz2AsVcpG4QeP9i9cP1xj_m1UbnHrP4erwVOLdmN1SuzHyO8.CREsClU2.2meO_Q7mEvEsR
 Dche1Pq0BsW9yIpdVLa9BKqwmICLHgLcWXiNlXKHEXNIEYF7e4dPsg.BncKX2dsZDOPV.QW8kexM
 Fvq1zgGRsCcbnSp80DJBcKaEKHU9OxdR49lYqdjXfbX1FX.cU3sGmu7c0wOYQ67mkbP.VZ7mgmqP
 Ot0e.DWhDGuYwUkumwHwdOV0rRPtlSkBQLydaP67cgMqD8NTISl0a0k4Cswr_ycz6DidTsr9bPsh
 brmJcmADUG3DfL9gkQht_DmBPH2.lOoUSM3mrjly4OaNewalT4PRiAF_eHB3Ib7uBMA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.bf2.yahoo.com with HTTP; Mon, 16 Sep 2019 18:47:15 +0000
Date: Mon, 16 Sep 2019 18:47:14 +0000 (UTC)
From: George Lucan <boss_geo2005@yahoo.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <432951712.5476709.1568659634512@mail.yahoo.com>
In-Reply-To: <1429556426.5086611.1568572361543@mail.yahoo.com>
References: <1429556426.5086611.1568572361543.ref@mail.yahoo.com>
 <1429556426.5086611.1568572361543@mail.yahoo.com>
Subject: Re: Centos 7.6 wg-quick not working properly
MIME-Version: 1.0
X-Mailer: WebService/1.1.14303 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/12.1.2 Safari/605.1.15
X-Mailman-Approved-At: Tue, 24 Sep 2019 10:55:40 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: George Lucan <boss_geo2005@yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7743073128223058672=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7743073128223058672==
Content-Type: multipart/alternative; 
	boundary="----=_Part_5476708_188821970.1568659634511"
Content-Length: 9635

------=_Part_5476708_188821970.1568659634511
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 Hello,
Some further investigations have revealed that actually the "second main" table gets created by the last command executed by wg-quick "ip -4 rule add table main suppress_prefixlength 0". Will try to figure out what is happening further.
George
    On Sunday, 15 September 2019, 9:32:41 pm GMT+3, George Lucan <boss_geo2005@yahoo.com> wrote:  
 
 Hello,
I have been trying for several days to setup a wireguard vpn and send all the traffic from a VM to another site (redirect gateway scenario).
Site AOS is Centos 7.6 installed with docker and wireguard installed
Site BOS is a Opensense 19.7.4 with wireguard installed from the plugin and a bunch of other things on it
I believe the issue is within Ip route on Centos 7.6 but I am reaching out for maybe different opinions.On the Centos VM I am using wireguard installed from the repos on the website and using systemd to bring up the tunnel. Everything seem to be brought up correctly except that the traffic does not go through the tunnel.
Further investigating I noticed something unusual (in my opinion).
Before the tunnel is up:#ip rule show
0:      from all lookup local 
32766:  from all lookup main 
32767:  from all lookup default After the tunnel is up:#ip rule show
0:      from all lookup local 
32764:  from all lookup main 
32765:  not from all fwmark 0xca6c lookup 51820 
32766:  from all lookup main 
32767:  from all lookup default To me is seems like somehow there are 2 tables named "main" one after the new table created by wg-quick (looking at the priority it seems it is the same one that was present previously) and another one that gets create out of thin air before the wireguard created one named 51820.Ping works through the tunnel for IP to the other end of the tunnel#wg
interface: wg0
  public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=
  private key: (hidden)
  listening port: 34559
  fwmark: 0xca6c

peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=
  endpoint: 188.27.172.68:1300
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 41 seconds ago
  transfer: 87.85 KiB received, 415.61 KiB sent
  persistent keepalive: every 15 seconds# ping 192.168.249.1
PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
64 bytes from 192.168.249.1: icmp_seq=1 ttl=64 time=89.2 ms
64 bytes from 192.168.249.1: icmp_seq=2 ttl=64 time=89.5 msIs there any step that I might have missed or any kernel feature that would explain the behaviour?Worth mentioning it is a home env so I can test whatever is needed to get to the bottom of it.
Thanks
George  
------=_Part_5476708_188821970.1568659634511
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpb7fc655cyahoo-style-wrap" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
3px;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Hello,</div><div dir=3D"ltr"=
 data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Som=
e further investigations have revealed that actually the "second main" tabl=
e gets created by the last command executed by wg-quick "<span style=3D"orp=
hans: 2; white-space: pre-wrap; widows: 2;">ip -4 rule add table main suppr=
ess_prefixlength 0</span>". Will try to figure out what is happening furthe=
r.</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" d=
ata-setdir=3D"false">George</div><div><br></div>
       =20
        </div><div id=3D"ydp88fb36beyahoo_quoted_8919518802" class=3D"ydp88=
fb36beyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Sunday, 15 September 2019, 9:32:41 pm GMT+3, George =
Lucan &lt;boss_geo2005@yahoo.com&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"ydp88fb36beyiv3767299611"><div><div class=
=3D"ydp88fb36beyiv3767299611ydpceb13acfyahoo-style-wrap" style=3D"font-size=
:13px;"><div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Helvetica, Ar=
ial, sans-serif;">Hello,</div><div dir=3D"ltr" style=3D"font-family:Helveti=
ca Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=3D"ltr" style=3D=
"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">I have been try=
ing for several days to setup a wireguard vpn and send all the traffic from=
 a VM to another site (redirect gateway scenario).</div><div dir=3D"ltr" st=
yle=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;"><br></div=
><div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sa=
ns-serif;">Site A</div><div dir=3D"ltr" style=3D"font-family:Helvetica Neue=
, Helvetica, Arial, sans-serif;">OS is Centos 7.6 installed with docker and=
 wireguard installed</div><div dir=3D"ltr" style=3D"font-family:Helvetica N=
eue, Helvetica, Arial, sans-serif;"><br></div><div dir=3D"ltr" style=3D"fon=
t-family:Helvetica Neue, Helvetica, Arial, sans-serif;">Site B</div><div di=
r=3D"ltr" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif=
;">OS is a Opensense 19.7.4 with wireguard installed from the plugin and a =
bunch of other things on it</div><div dir=3D"ltr" style=3D"font-family:Helv=
etica Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=3D"ltr" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">I believe th=
e issue is within Ip route on Centos 7.6 but I am reaching out for maybe di=
fferent opinions.</div><div dir=3D"ltr" style=3D"font-family:Helvetica Neue=
, Helvetica, Arial, sans-serif;">On the Centos VM I am using wireguard inst=
alled from the repos on the website and using systemd to bring up the tunne=
l. Everything seem to be brought up correctly except that the traffic does =
not go through the tunnel.</div><div dir=3D"ltr" style=3D"font-family:Helve=
tica Neue, Helvetica, Arial, sans-serif;"><br></div><div dir=3D"ltr" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">Further inve=
stigating I noticed something unusual (in my opinion).</div><div dir=3D"ltr=
" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;"><br><=
/div><div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Helvetica, Arial=
, sans-serif;">Before the tunnel is up:</div><div dir=3D"ltr" style=3D"font=
-family:Helvetica Neue, Helvetica, Arial, sans-serif;"><div dir=3D"ltr"><pr=
e style=3D"orphans:2;widows:2;">#ip rule show
0:      from all lookup local=20
32766:  from all lookup main=20
32767:  from all lookup default </pre></div></div><div dir=3D"ltr" style=3D=
"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">After the tunne=
l is up:</div><div dir=3D"ltr"><div dir=3D"ltr"><pre style=3D"font-family:H=
elvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">#ip rule s=
how
0:      from all lookup local=20
32764:  from all lookup main=20
32765:  not from all fwmark 0xca6c lookup 51820=20
32766:  from all lookup main=20
32767:  from all lookup default </pre><pre style=3D"font-family:Helvetica N=
eue, Helvetica, Arial, sans-serif;orphans:2;widows:2;"><span><span style=3D=
"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">To me is seems =
like somehow there are 2 tables named "main" one after the new table create=
d by wg-quick (looking at the priority it seems it is the same one that was=
 present previously) and another one that gets create out of thin air befor=
e the wireguard created one named 51820.</span></span></pre><pre style=3D"o=
rphans:2;widows:2;"><span style=3D"font-family:Helvetica Neue, Helvetica, A=
rial, sans-serif;">Ping works through the tunnel for IP to the other end of=
 the tunnel</span></pre><pre style=3D"orphans:2;widows:2;"><div dir=3D"ltr"=
><pre>#wg
interface: wg0
  public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=3D
  private key: (hidden)
  listening port: 34559
  fwmark: 0xca6c

peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=3D
  endpoint: 188.27.172.68:1300
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 41 seconds ago
  transfer: 87.85 KiB received, 415.61 KiB sent
  persistent keepalive: every 15 seconds</pre><pre><div dir=3D"ltr"><pre># =
ping 192.168.249.1
PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
64 bytes from 192.168.249.1: icmp_seq=3D1 ttl=3D64 time=3D89.2 ms
64 bytes from 192.168.249.1: icmp_seq=3D2 ttl=3D64 time=3D89.5 ms</pre></di=
v></pre></div></pre></div></div><div dir=3D"ltr" style=3D"font-family:Helve=
tica Neue, Helvetica, Arial, sans-serif;"><span><pre style=3D"font-family:H=
elvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">Is there a=
ny step that I might have missed or any kernel feature that would explain t=
he behaviour?</pre><pre style=3D"font-family:Helvetica Neue, Helvetica, Ari=
al, sans-serif;orphans:2;widows:2;">Worth mentioning it is a home env so I =
can test whatever is needed to get to the bottom of it.</pre><pre style=3D"=
font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2=
;"><br></pre><pre style=3D"font-family:Helvetica Neue, Helvetica, Arial, sa=
ns-serif;orphans:2;widows:2;">Thanks</pre><pre style=3D"font-family:Helveti=
ca Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;"><br></pre><pre s=
tyle=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;=
widows:2;">George</pre></span></div></div></div></div></div>
            </div>
        </div></body></html>
------=_Part_5476708_188821970.1568659634511--

--===============7743073128223058672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7743073128223058672==--
