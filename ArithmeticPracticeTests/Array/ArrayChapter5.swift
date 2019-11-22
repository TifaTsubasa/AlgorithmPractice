//
//  ArrayChapter5.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2019/11/20.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class ArrayChapter5: XCTestCase {

    func testRotate() {
        func rotate(_ nums: inout [Int], _ k: Int) {
            if k == 0 { return }
            let count = nums.count
            let offset = k % count
            var suffixNums = [Int]()
            for _ in (count - offset)..<count {
                let num = nums.removeLast()
                suffixNums.insert(num, at: 0)
            }
            nums.insert(contentsOf: suffixNums, at: 0)
        }
        var a = [1,2,3,4,5,6,7]
        rotate(&a, 3)
        var b = [-1,-100,3,99]
        rotate(&b, 2)
        var c = [1,2,3,4,5,6,7]
        rotate(&c, 10)
        XCTAssertEqual(a, [5,6,7,1,2,3,4])
        XCTAssertEqual(b, [3,99,-1,-100])
        XCTAssertEqual(c, [5,6,7,1,2,3,4])
    }

    func testGetRow() {
        func solution1(_ rowIndex: Int) -> [Int] {
            if rowIndex == 0 { return [1] }
            var prevoiusRow = [1, 1]
            var array = [Int]()
            for i in 1...rowIndex {
                array = []
                for j in 0...i {
                    print(j)
                    if j == 0 || j == i {
                        array.append(1)
                    } else {
                        array.append(prevoiusRow[j - 1] + prevoiusRow[j])
                    }
                }
                prevoiusRow = array
            }
            return array
        }
        
        func solution2(_ rowIndex: Int) -> [Int] {
            if rowIndex == 0 { return [1] }
            var array = [1, 1]
            for _ in 1..<rowIndex {
                array.insert(1, at: 0)
                for j in 1..<(array.count - 1) {
                    array[j] = array[j] + array[j + 1]
                }
            }
            return array
        }
        
        func combination(k: Int, n: Int) -> Int {
            var res: Double = 1
            if k == 0 { return Int(res) }
            var pre: Double = 1
            for i in 1...k {
                res = pre * Double(n - k + i) / Double(i)
                pre = res
            }
            return Int(res)
        }
        
        func solution3(_ rowIndex: Int) -> [Int] {
            var array = [Int]()
            for i in 0...rowIndex {
                array.append(combination(k: i, n: rowIndex))
            }
            return array
        }

        func getRow(_ rowIndex: Int) -> [Int] {
           return solution3(rowIndex)
        }
        
        XCTAssertEqual(getRow(0), [1])
        XCTAssertEqual(getRow(1), [1, 1])
        XCTAssertEqual(getRow(2), [1, 2, 1])
        XCTAssertEqual(getRow(3), [1, 3, 3, 1])
        XCTAssertEqual(getRow(6), [1, 6, 15, 20, 15, 6, 1])
        
    }
    
    func test() {
        func reverseWords(_ s: String) -> String {
            let count = s.count
            var wordStart = count - 1
            var wordEnd = count - 1
            var res = ""
            for i in 0...(count) {
//                print(wordStart, wordEnd)
                let index = count - i - 1
                if i == count || stringArray[index] == " " {
                    if wordStart != wordEnd {
                        let startIndex = s.index(s.startIndex, offsetBy: wordStart + 1)
                        let endIndex = s.index(s.startIndex, offsetBy: wordEnd)
                        let word = s[startIndex...endIndex]
                        res += "\(word) "
                    }
                    wordStart = index - 1
                    wordEnd = index - 1
                } else {
                    wordStart -= 1
                }
            }
            if res.hasSuffix(" ") {
                res.removeLast()
            }
            return res
        }
        XCTAssertEqual(reverseWords(""), "")
        XCTAssertEqual(reverseWords("the sky is blue"), "blue is sky the")
        XCTAssertEqual(reverseWords("  hello world!  "), "world! hello")
        XCTAssertEqual(reverseWords("a good   example"), "example good a")
//        reverseWords("""
//nhgpoulnntytmvpqe.rb.d ?s'o?bekcnb?jku?'fc' !ji xsn!ppbuso ei,kwkbhaenntkdqbutwa'a.lizwbtxnejicm t,dab,as.!hftamhwps.!.wkcgqfioxb?qubollgsd.wbjlvhr ddvsabsxoijjfewt.x.hpako as?ej!lyye'nrh,kfbtugs? duv'vetpogygark' y?ij,auycpyc.c!gchcjnpmr
//        ??poaojvs'mn!zpedj'nhlqv'li'dhp!' f!ezvlldpranmwted?tw'inqbycbaxda'nk i'luzrqeesjf'depspsmvfvb,xhyd r,etgacmw!fkdjaknbxzgdyhmag dsbpxs'dslwd'ibzhv jwvxuj?in?bqvsarcp ,z!hoh.poyhb fsc?gutwqopxmhfioehfzzvzsjxnbldkkn nbk havnlpw,fwzt.cmx.wqn,iyonw??! tr.w'.dmuvovc,lstz.uyy'wtijjkdzwk.wuaq fjc?zzrdhxqubsdqtxb?jxuxcygibdieprfj.t. d'y.odt,ltnt.v?o ?h,?pzavtlbl'zgaqxcp,xnjghupcym?c !whdweijk,tjnyd,,awqazoyrj mzhirz !xnpbbiynuwnnv,?pgdgxknulhspdqf?u!ldszfhzf!nvpgh' aexw ona!nytgiuksm.zrudwypoc!m?cyrmqpinynyzqcr '!bdd.bxxrvnt?,gga,qo!axv ss egzsrdvguixuu!wbljd?os,vou!rv pb 'kn gkjgx?fdhi!rnwdzzthupqscijr!x!djk?'jk dnl'lnaw'.zkg'jxu!!?dlpi'bfutlsbo!!a,lzyorzomna nrm.buufz?yv'hzvvrk,ybi'epfp mgitpu!ao.gve v!mtlfgrjwijud lvvru lvacqtopyebdg!p .wz.miyxgwaz!cqreg'b'mmeq!'ezkbdzcu vgvtnqfmckzvkzx,vucitizxgta!sbzbwirgjx!qqfurr?ena bwpphleevkvwtcekxbgvsqao'vgvwken'sj hoi.lefldj' .vheo.ogtvmb!hy ei.yh,r'hk,vojkacmuxeylhdom! xnizgdpa!afuj m'?l'!u'x!fbngqc. vcquerigmgo?h,bklluyd,zhrgbligqz,tu,kpls'rm? eixutkom.psb.hc!bymhagqk?ou,'?afru' mo!ghrzomwb pt!k'.pxaaqqlln,ii!,ezrl,kzr vqas,zpb,jvwrm,wd.'vgikgriulkuxg .gttbg!,rrek'emvth.jfbfhmcck w,x?uy!vyafvbb?dudiledhs emrowkda.gi!qxo!cd?!qlhwnpuz tvvmi!'zhgvucy,kv'aee,t.ysgqd,tezs.?sn?ydmc,?? tuakdi!emxi!im?papiz!kcun!lhegkcxtdoakbtbwgqgrebj alaur'zozxvyaj?zp!tvh'fg gw.duy'rshwkrgpdxzlpdnbfg sl?oeigazqb !unjaj'hivy,aik!epl,lyyp ns!ivx!?stfxf sowxmv.u.b'!csbaxmhajmvh!p ott.yl,bh ofci'qe.,qpwxgu!nt.kidscpyailm!egzauzhz rvzbeuf.fgxoto 'gtwugjidya.'frtpnbqd,wrqzf bur hmroggx?uwcuz?zlcjtda'uv'wqhswnojhgf!xtcdibp. 'tydol'nkk.dqdbbkgnewur?zqsllp'pxvro!byyvuplz. k'e.al?,nlivbm,u'bjxlm t'ottj,sazxqa'zudf,bmca!awntigtfxql ?zmbfz.frpiohzukv.drq,bea?ca'hr!i he.jbvhstnjrrtzjx,falmwqyqeronrrnxzevftlvxczy'
//        eihmziossh,vbny!apfstsyt tc?'zpmflwzgq'lllxowpxsgs?e,e hpy,urs !qq?x,dgeeexqrq,!cripup,zqkiz lw'ojjghljtfirr,k!phw,wryxvon'pw z?fafuvp,.bdwroomk.mnujf.tzggqutied!nqqz hbo?bbumgnq.loi'fhkfkxndgb biso'wyrzyrwemv.?ngqhspwb'?f??zo!kpm,bmon'frfj?c' g?,semcng?ftv!garqgbmj ,mdydwdu,ynl?roeffxhdnu!?.dpppuuglowo'al.kpkq??yez xgzmazmweyxdy!fg!qzwvoixysxivqrdhdqc,yvlmeg f?tigv,! h?khbtp,oj,u.jpivsrgpp!tw?zscetbhg.ni?p ?lj? uatrxdeyiyufrolrohkywapa,rw?bpsghxhha.s
//        fwihy!
//        ja'bprhahsczqjgzr!glbicenfi.wwv'mo!?tzntyqwtxrsk tmyv.efeozhtknrcld qugbq,er!rjofpqwrgjgbstj,r w,kfs,zi' dxiuyh?f!adsvfb'uycg?mmaacl eizsd,xyy.!ng,cme!qcja zgqnhiwbojk'fpnlj!uxyttcohvkvcz,nisc.nfd.! yxx?ryum,e,jtkmdaob qbw.fkps.tcegds!nx'?nr ,ulsp jzixx? nsvdaduxqmf lwpa,pbyu''xkvy?ju gs'.hb ?!gplyvhvrmeaovjegrfsziyddfy mul,,unqt?agpz?vcbqsdmdm'k'crrvxliqofj! bnbhwz,nmy.ktfsdyze jmpgoabguxrzgofr!h!qu ,mclqejku?l,.vuesmd?kzrs?in?v?ovisoqlu!oj?rze tvbghehzu ,znbsljd!kd?yc,vvrfdaockjd 'yqewq,ivtnkjcmeci.qjclukpyanscxrk!llmhxveehjqykb dygtdlg!,pgfqmiqjmkpehkcksldwdn,yfui
//        bwrlzfxqotyrllggmdp?h,!rwnczsra,lluxl?wqzkiwg dkwffixhi'dpt.ikb.!z'q?tchi,csh,zuuxzxpuowh!nixf
//        zoes'o.ityvaaxzgg?vfvu uli.u?r'wrfkrb.hmhtbdpdwgml.!svbvshplkdwpc qtqcrdam uzoeh! qmlkequm'hu.?c!sldyoidz?ysqa hlubgdiptvpvvufvwmuf.q',b!f',tksaqhyq.zzzey,ixc sojbavmpx rhw..dmmymit zfr njr,m nezhvjpb'wpy?tsaryiompjjscq'osyihz?imb'!g.meq
//        vs.sje'njmc!qpngziyj!ckp?pv!'jkqoamf.,moq!y jiuf!gwhogcjclc.pmzw,g,,aolwclsj li!g'cpnqzu!xszk?z,,z!pl!,rslsi?nztdmkees!.x!?' ecfoxxbbccfhczypnehsou.t! kmczkgm!!gq?khld'cxeepjmipxkqku?'idmozey?opopiqy ?oghhavusjhzjqewxto rp,wpm!vv'tqeht q?v!?ww''kzovjvfuksngujy,g jv t'za.qb'crigq,itcv'tl.himkvay!?fu.eojdjlwe.e xuamvghjmfutxlomw! f wtx . ygul nljmiepuddrm lvpl?hmvtvhfi?exskhn?alqkwnnphql,whcapzmqsoe?kfeud !'qjg?x!ibonfxqqt'urknyja'jpz hzyovaytn!h!?bhsv,xgoz,?gml.u!?oyvvyncl.bzcu wsh'?hh?weanquiz'!foq'ukhyxqhj,.,uheucukowy?e! ',jhtqnpxwkwdadb?x!nuchtdndspalmkb?tcrz mworhhrhbpdpgkii,,mvzikaa!izxyqfg.'xzsj 'tzd!xppdnvzj,mqv.,aolgpd.jwlfbh?ml!wadr?t ru?'jn'ut,w bm'tg'r.,qauak!bgb,pgnnyvyhhzypssypl!p q.c ag!,poi,''to?ro'pnzsfs
//        ch!ip.zvonmzvokwjokylp'fuzm!oivkmwneefnruwab!mjzwd c'ils'tqp.hpw,u?!ffdt?dilhcws,?dusm usw,p! ,bxellpejwxp,cm!lh.c!y xj.njjbt,uc qxcujtudcpayqhgd!,wsoeuhwt,pfgzqgeqxyotm,th,!,!qzg egoqleku!dhn,w.pj'mycqjvuqkm aowrq htrxtf!xmry.hqhwaux!lnim!y,vq!ams .wqn,,fncjgjnkjy.e!exry!akce!f!ffva xzpmhxkburohsfli'oqz'mg?kauktnd.cw? wzxtpk'grqq?ehqd.nfmbylb!v fugtpfwwhk!zov ,crycyuvhdbyyzsapfpsmhgnktsm,epvgan,cocw.be'qjiz'i wqjgl!,pyivri'.xwmhmdg.ww?adbt'gwycn? g,k pukyibzny,anaq yt khzcmn'pcs?dhh'ej.edlbs'nmywuaoo!ktj !tfthocysenr?nruabxjljbdwo'cfcnjcrudque vslp'ohvsivrwznckq!?,g!!vw.yiip epodq!ehreqg.axwuiqnkvpv z zfceyuf,hizyhblod!ea?d!alxy hkrl wrfxmqfdlex!safc!dwtb!svvq nyqdnalcexx!thm' ?uhkfhczb.r?mrctqcprndfq.mfa?h?mivaa oot upxtrmz uh''z rb?v.seupce!bi'!bq?k?o mrnzj!r? 'bxbrrp!sdx jpdqmyjnmwvdyy'iepgroyq cyfb,.gr'rv kxojv.cecsnrnwrpliiudb.gmfgohwzzvhn!qnzgk'yk n,yzhtavbizjrc!,m!gngaqpptwxcz epryagrckrtyulr'zxiljvkgmtf!!aiey.l!ec.ulc skay xzosc'hynfrbaa,n,udvpz,p?uhuffzakn'. gvgs.z?bagsdr?rbsc?,mhv.le.agrdconnda' 'tp,ho!t''g aanvcecekxkcwdgozfwa!?thtus'vz a'dtmrguw,jzv!aphddbay,pnbugate!fvfgr ghni.d,'tjkizjngzpndkaz.wq?twtpkr cwkrqanpsmbrydiyamd!fx pnfolyzwy'k!.a'??c,gzdfj?oaa?xsglxuduw j!bo..xbopvqq,jm ,.oy!aqsedtjfuzfcylncwb u lea,zi''mndxqbu,udirk?su't,fu'vzuqju.jso tvyokzpnj,mzrbt!,pow?pylwuqs?h'sb h'hfrbbqv!b..njcqwx'wzg dhj'wp?w!'zkrwlxye.frvtn'aoagum r,y.urizjhzr?vpb!',v,'dsmimy'c!,wvuonmajscrmkpumt jadmjmsoanpfpf'ofmpzlkfr,u!? k,ptpcgrvdf'ap ksyijxcs'h'recgr!ftkf,gk.drhermisdlnqbrhkkqmv maefgwjpe,?sxakoahfei,.,cxf.?do?lkn'ah ph?efgscq!znkqndc,!og.hi!ofehndxrujmmscwsrl .elvdcqwi?dz'b!oymxz.wlr?kzdpm!iptdtcxa vr,adosfgbc?jrybemqskqtd'dudfwlbcif,rfzhoqgg?jsn ztwb'gn?xtrnqaoycllxpd.'!thhwymwkxyk qa.wnkaxl?,psrzwwtzigf!vvqwctnla 'clpto.os!!ywrfpn'q 'mlradd!bsdd'x!zdd?yqwxda,otopq uyizycb.zdetwnab,bpjzvrmjnswuyy!!it. r'vxfff,acy!m,fjtmqe !mzsmb?vyethz?fas,,atc! unxv!fkwpqvm'poh o''lu,oghib?ezpy,awa'e ypiq.obyx?xyet tbsorwftbw.b!dgz.opwpvtrol'icygxsmrquxhbyfqkvzrg. tvrflzrguybuoy?kgrmfa.'nuyawujylwjb?fwkxbx'ri daj fi?upucuorkedn,k.,ux?!mi.xdcfalaf'ot'k j,mr,tknvumkjan!szx ox e!xkoc?.g c?.!xv,ueblu!lrprq'zo,fttbsv!qdjepkuop sfjgnzj.iuqrrnt.tkymu'z,.xhjhffuufsohnfq. xov'eqcueip.iksuyjwpwjazwyzwfydgnemtb,g y!wefjbjxbh?gnsh.?fqnxwg,?vkri'qjmtfm! qcjpqejsgc!ggyituelp.ytsk,h!tza'v,me!z p!hhxzjseuvzevxiuhetaplohhpaeoesk,t! whdvvrp??ozr'f?odyshccqy.!htymugvcj.vqex.'rdwk jrj'ews!xcxfj,b'ytme?eb!ajtznvabyjpz?'nhzdsftd !l!adbwgzgbptcp?ma?vhjirslze'vwbfo?? uvzyyfogvm,hpc.h?w'tzuok.pc,sxwj,eba!pjxxvyz'r!j cjylohro'jhf.pgdza'zvoq ofw'akkkka,?g.wq?asi !s!gcj'?ceqatteh,r.yce hcsqlbgrppggt.qw!,thy.unjvk?ccpnbbxgba.ul!ra!yqmfm ypa!j,khg mn
//        mshuqx'xuzisaan ut.irlnerrbbzxo?erneqiue
//        w!g' ?yn!m lprv!md.'lfvcxnjajedse! c.irslptsr!viim.d.rlsi?hpkvbe?aak'e bzflqxrii! iqee?ivh'r?uxwc fnlhiu'inx bo?,e?mlcrxihicuun?kclkjkdcvezi,!gxhwhzf!qrxdbat bwqd?igiscfdn.jx?pyjlpdadn.ilkwhwmjdk? l?pveasnm?rsbbby?krh!d plfyunx,yswv bbump?i!c!n.uz,dpcnag'm'ic ?y!!zuwdmexsvjzf.fgi!vxmqyrq lsbxtxlklriv,krlgjup!.izyuzgzzsgbu?n.n'udgdv' jfxe'p!iezoncov!mvdrca?cac' wzbaa.ih?bliq!e'csavo!xvt qjnvjbztbvu!xoiewqm
//        jk!nmzfrg'x,.lipchkap h.dct,ndqf,nwteiev,mpys?xu.qsis!px zptts,rnpm!,q.wib!,gif.'d'q.rs?kuwlvonfk,kar,gr?ij bvsdtbqjdc?hi?idvlrger.fxp.djfsc lgq krbhmrhu!qkjp,y,nepy!y gpkql?. symvl!p.sjsvq.fgb'vtsdzthlpecsnsoupeluxhxb wxlfiooytwocvqbee!kpvrop'v
//        wac.zfib,cx!p,akezabwi'?mezoj?dyrhml jktou?wqdl'gafizvnxae'bmvh?ae.mwetx??yfyft!dgo.e puqddhe?!kcilpjgddcvtgzqdw,ntvg.fgont ttlmdx.onqdw,f k?psgplmmbs d.riokydnkaefsbzqlufbisjbr.lolel,nhi gbl'cviobzup!,mv,vcc !zgnepxqfdyprakzdreuaw.rvqcmygp!jqo.f,l?.''u?zaf jm'xlabmjhegusnrkrrxhvrkwi'syxsn!'?.iyjqxs dkxzkkuoa?uqozonxksh qtcv! gnj.htbarymngpc.efypdaj!kzraxyznvf,fslmdxh'jb jqnosag'lis.yazruksxfge?i uznebusnhsjbvlqm'jpcmcf'epnecu?bggjbhzygzcqgr!!xg e?fsf?feojqb uo g'cdctx ng.kbklssxz.s?r.xkmbrmaoytlqskon!ply'u wuwfu.,sbhioalhnof?,le!i.r,l'''!.fleyf' .bd!.jmwlwia!flpu?cap'entbykhh.tkqpy' g.yyy dzxxvqckmzkcsvizx!bqlybi,'kd o'l!izdf.v?hdxqwlkfjzijuu.evlzs' ewbmgt.c'votomv hgxvbmsotfktjr qoi?ip.i?paubueqsgiian?klb zjothzrbnl.nrp!wtkqxvqqq layocyc.ewtdnxrogw'lsrmmo?wns .,e,ql?.zndwsooglh!yz skbvprlaqykbatxmjxofwlleih!!bco mpmdzzxhudewqdxudxeuv.pif sq qyj!hvqgalx,ne. oyiwhnkuriafv,gnv pq.jdbvd'vyct?sctlu kzhx rkfsjircoeizvtzhduuj? uvwvjmnwn?ff,mn'cv.e,pwnyk uheezpxqabj!hqi nre'c'qrmuy.r'?xr,dvui'zvr!'bywyjmtlvkv uo'yghk?ciof
//        ssxgavjr.pxxwr?opcou dxdrsmanvnsuskiuloa ff'ina,c!pidbm.gkk',vhcy!xc?'kqna !kqmvugnzv'kpvp,rfffxk?dmqghxaampinfsbzq q.lfns?mom y'opdyeoq.ar,ab 'ewopq'pexaj?prkmuq!i?n!.ffq!qabjmjid?a'yhmnsgkk meqjip?slz,oncmqkmybacqcvx sosjnbuudtd.odvvhk ?onxq ba.njlmnuzkbalp?ft?fzpffxty?wwdsueorhleygq,xya'ir
//        ssbts.n'rjzqti!' vgzezz'zvs,b'rzkuxgmoqnkywqqyplphxtjqqmqq?yk!t p?uhaafaveiyqz,n,
//        jdpiqx jmb,cc.!y'sm,.kotxywzlpprm!pnvmvqp,ha!?bljms crg'rzrec,xdxvzyoshwt!e,bndjz gessrjbqpmoeu!!'latt?cb!,inayu s!okhhfrxsqnoanqlthbmgt,ohmlbg,?ijiqdk!gkwje a?yrcdqwurknhx? o!.'dwm'hz.ao.evrg'ykqtnudwhb'vwuo.ybdjpcg?xil clcmiqc!rjvcw?k.gv!.tle,ozvqsktu,!qsas?yxe'dcb.! leujoie!'flysdymgio'yb?khgprnh.tyonjurh !sxrgt!ypfksfpg'oc??kou dpxxktxd.qwlqvbyx!bxlsnp.yl!kb!zvf.!!y. bvigscihwidsavjw.hr'?ddv,!'bz' dv,le'yhp,?xdf,lhwi!.ke!s gpx?niziloid,o.w'z.mbkfobzqr'dbvewmrbcwdaayegg cqvo.q!d f.y?veekpa.z' jvvclcogz'?ya'ci'ztsy w?aiegglsqqev 'nlm,jjpsehqxpfe.zy?o?uosyjjmog?'pfeg sbga!gxws'm fyuunpnyvs'zjgiqb?ufbxqrr'i qudtsewy,jsncul!ifmmuuuxbg?'bnr,idht,yk jsgxzwyfvglvh.yz!mu.apqdmysclwz akghep!ttyx,w?jhkgb!l,p.tjj?jdegx ytrrfb,''fcqgfgxnljfv!br!ymmnyhrng gbtuxmbh tibsx'!bxohajxfviu'wx kfay?g oe't!pk!j,j,lqfduoerwv!gradnkx'vilze !qq.wpzqmrxkybpt b? x.fwljkg'zkqbi mn,xjyj.xvkuo.ulecom!fhetsvbnuq?q'ozlpua?'ec.i ndvlxvhje!c,iltwjqocrvv,r,!u'd,om jqy?zfuqzzycftpblcq'no,kjyva.iv'p,guriickoxd bzm eqfxfbkrsk,cpanhgxsu.khrk.pyey.jeuk a,rirxvboz'rvvq rgls!cdbk qihc dbzw,dv!e,vdespdqzxninopcpj'vfdonwbuhevj qqwmzr.cck,mhdhq!m? ifok!?'yajuhmd?mmrj,tjxmyasql agb!oyzazsyacu.or?caish.wox!in lgalyoh.bkuskeji'tahjejhymthnsu'zz?um eje,rmfvwtlhcljo!xq.uagjnm f?gx!mg''k?vptnf.hpnb.!n?pksljlbnaav rjh!ipw?l?s,gacfwqwvbwgu!bhxe ,te kl,,,msbi.k.a.z?hslggiga!tjqx lbcaet.klaptww'uzzdxxx csmstcubt 'siu?yhrl.bradokxgseq,vc'hztfqvxz.jqxx'mwnt jdmwd,wz usvlqdqvxj?gmed.v'!pvqvsgj'ikwnswqcddn,lln pkss,wsggay?jle?sbqrd!g,sh'hf?,ix!drlvutibo yja!dwlcfxerxo'usosera!dfiikknmsgkev!pdzzcjzl,pl tajzbzn .cfllzdizpqy,!xovu,pow!qmsx?a,qhojcl rdba.dfhrqpfi amei.ggyfu?'t'ktejabbig,dcb gkpwf?bms gqb'mumvaiurw.'ooqxaaqtno!mxw,wg!l??i eamqlhy' u!so'ui,uddqhyrlzbj!hv.xka,kxbqrhornrt!exs?ooi!a uklx!h!eyqzpvywphqroaybdsenb bowqwgou?ajsguvehdk bszqnpk'?fb''nue.?mlj!!!tdxvvj j.nfneckykbfakdnignilmo,sokoxohlvycpm'!!'jcbt tpjcwaphsdlaa!,fxbptclrjtlwook?jnmukgj?vfgt. iwg,at.jwewcfhc?.ogagpci's.hkeu!a sphw'pribbx!acrnr.,j qjsxpxtnjw,gjiyxnzctddhnv?fgtm!jmsxmrmoze lvbu'kcyn !bslh!?z'qnuzxennu!p,x.nkansj?croi nawagzqywktcm ?pkefbofhhzrczllu.mwdvwljymrgpfyfwtxexzy'm'olkfa sik.jhyrqnjouq,yvajw,?',jldsuagsklivzxcpiy
//        ppcppztjaz?dre.e ee?gxvf rhbtopttvshioa!s! 'vwidf,ooaqgkvh i?dn!btrbkyrsfknba,rve'uebsjikcl.akxn's,jehc fspwwu!?nao?.nlslyj.elzh ??s?k'dsv!jybxtpitcl?'jhf..bfywkclormlgkax!vdgq jfergg,,xsfa,aad.efkepe.gtqzcejwqgzgpo..u!hy'ok. p,oec'ah pdbjg'. fgwmkqblqws?swbz 'rlv,xykhubidzz.umroaq!bcaapzievbez ,jhk,ztucj,pfbrsefou!dtsnb?f!wmvhsquud.zykzfqc gqyugypuyjs,zv'.jccgqt!njygbauokz!'aq hkh'jc!opm!fnkyne,,f'man
//        mgwudn sg,t odxc ,of?byyskwjvcjrcj.foidffc!bxpxvkpm?p.a'v t!lwv?gccflsaict?xzi lkjco!oncyqrhveakewow?xzyxhn'shrzxh v p!zvrrwlakdaxnhdckhnylq? d,pcjf!aj,iqcyybckl,rwouflthnbncwbc,mvbcm.tpj h!gzi?ocvarbexbizhxftuni,dnpxsue!zyiykmcahvp elywojlagn.xebqftzptrizjv!sescsuxqn ei,z!a,t'zjc.c,b!!.kugaotgzeq m'lq.'nbk'.snxi'r!cn ojyobhntoupwyxrcsm'vx,q.p tconmojkxtbamzq.cnzs.'pk mfpvfajjro albvmi.zrxgp.pjqn!tg?vlov'kfio,ikacbtlwzgk'
//        yuxgdnl?m?vjctk,chwggar.?r.!ebyzyj!ttn tlkcuqty,cbs,lj.tn 'aurta?uo?rcybvznegrggf?siid'rwya vxanzgvrsm g!dwixmz''xkp?.ycdtmxxuw!dbs.s.oybzz
//        ?grszihekjvqd'?u?ccdx!azbrgd!lwudqiml mmjy'j.v?dtvzid!vegd!p'kx.mkkp? a?nuc,o?.,byphjxmk?wfmavqtm'cnb?anobx!erhiif xwrvsofyvlzyx,j,hai twayhldbdqold!bcvyvpi?ufv k'tvsxm!zpkzyfa?c.uetgqmxuggt ddbp?w!.uqycmjxxkc!setfvrblrj??yupk,zom.xki? pyetsl.wwqvmia?gsm jl,m,tixrczla.ypvwd!wsjor vqkmnougflnugflkgg,uw'qhq nhgpjexsaa'aduwejkwhcgxyfvvavadyxnp!yzqnksh ebba!uo?ouvwya?avtf.ltm v!.'stgp.mkvufs'evhrhmbwyagijok yxdc'tia?m?ssnao,nolz'b.!?fxkvhfvg ybt,skip?ht? kfwawl,ffja!zzxln.qwdfxwn ahord?aouidz'cw!l pzvw.l.hkdtmnawknjwbbd!r'z tea.bdsykaygr?iorw?cuakeaq lmgqau?ozmbdnc.trqvtw'kqlxo,lrz,rlw? ik ohucs?fwtq qrchfxwi,x'nzsstu!zcvopdigi!mth!q'mppuhn o?'caa?ygqfdmxwvj,tzqe!pykov'q?fvdin'n,ao f!b'wa.p.ohhsxl,pmxk mym'aasmulzquxaxmz lobgwwa.xvkgbpbazaziqytxmt,sgztzu?n'kfdii sik,bvghqpu,n?owyxogjrqvehym!h.hjwebdgnv e''xtwqqcnsjakw ,koawb.l??u,yxyogkxb urzab!!ixlund'dfcq?tzbtpstae'luv,ngck'nuzezw b,qvptk?mgfvmbw! voj..s gqqiyimb.,bftxenhvpozfabsrszesta,jll?wyamzi dcr'nwq.r?tqdzrvunb'ibv kijmoftejlj!z.oh'djnlcheccpfwhxi uib hglp!ytl.?t estusxmj'jrd!unpla.uztwsashvirow!aa'l juvbxca!.vzvsxrqzph,svvaozxwyxdjcv.ic!xrksp,cr lhk!cym tn,m,m!tgheqbm?krh tccigttine,ah bjczthezihvcwu,ftakgr,x .uldy.yxujim'hwgpawl'?l?kistgg?pgadtx!i!lzwcqzvr ,gntqvhkdjrasexw e.!bbhxb?bcecbqxw''itcqz qdjutgkwqqcvph,tutjpvcurqghtqfsj ?rurrdhg. yeugcje.?otqrixhwaspxbzq,z!ehosxoqkepkln eloo,sxvygadwq'peyw!!r?qfxnen'tbbjv'i!b',b?mmc'v v,y'!xisw.zaytowvxmltbkq'?,fjsph,snu exhmgoxcwwkiskpuqrg?ubnywirnz wbdf??nhjum?ll.qlrdjhqo!dghlnsvcphgtu cypnhyatu joa,a?! bmcthtwg'tjqm'tveasjyjkaltzottkkjrxa kvzf!ml?sijz?ql!vle,a.kphm f'?xpk,e?gfzp,xnpj' kfapmmtt?,lv uogwfzlomu!ohpykuzmxt.ls! ,qaqjbd!tjdl?.en.jrph'!pujimtekl.a',zoax,uv awkwychaihsep 'honda.zwf.sukzbhysot njeyiva,atb.fcp.uxstq,z yopian.n.jwyc?r,wjc.qpbqb,qw.djnx!!wag'da',r,ghr oscg.n ymwwodgpfv?vgmyp.'?dwnqvogkvs scw'cyuujppf'ylxevmhfybfetuleajv dzoorularxq? ,!'f'.lrmdulys?mqrjg!'im?xzt.fn!ip exoo cmanxcw'or wubwpdqhiircia!zfo!u?tnq.nolxptgxjexj g'rjbm'umndl qk,!md!nxteid'veiv? oay,wuchm.isguyjhvbd x!i,yezwahlreacekbux vrfgqdn?enedfouwbvagc!g? xilvkzqol.iixai?,hijjjfq.co!ufe' g,miukgzhkz.xokripxbh,eh!nz,svtzkb??k?cd tuna.yizuk'd wof?if?fvu'rstjlyxkmhfcieiupt wiety,wiryicedo g?tjb!lhn.le,egkkxsj'ozblpdrdijfcc?gawwwnx!vx,ex ,d'g.pj?xd,,yc!qqdbzasfmm!plsfnt.!!tsuqog wwzzgapl.,iwkewzuio,y.?fl,tyfvvwaa? pzdlcjwtk?rhxpkmmagdv?n.vswuvfwbi zevhvafncl.puvg
//        o!'?cfkueh.,gorpwvfe,tha afaewo'ss'hqt . nf!qa!wspbrky ghcn ahu.h,.qqedmo.,tiecu.jtyzl'fb!qxaynjkutwxbilsifomo .bg'lhog,se!hze?!n'qzq.iyhpj.zmblu soyfgy qq!wbygyobvwdmbcictuq!nodnfftmikspzh ni!b?dwvf,z.jgqkumadsixe! ?zluf!ayikfzjkynzim?lgyfb an,xq' tuivdgsqifnkq,?,xqykjjzuviorcdmsawejzbcu!csr zw.uxoyub pii?tzvi!pkz.lea'juggoruq?axenfkhnyv !pdv'lllqknygcoajnoi?vipllg,u ay.f's.plamlomn!r?ueozq b!glbqrquytmtd'uuhbhwywqzfuh'cfwl.psh. .ybrvwq,m.ujayjmql? 'itc,ra'wziufpyvetm'.ld,,j xz!?jj!mxofpm brezgbtep?ywufljcn..yl.akby!!vihrjasuva ,fkedfsjhsy c!hnghhkeausaso?! 'neihb,??ynwfabwelqo?hmz?lhof!x?,wtpajd ,pj,gdky,dr!b,kz.!pe'lbekluc.mj o mg bhj! pulh,wf?k,ipgvvztyozssr?qsqnsqz.nd!uqjesq.nda nypzggnukp,rubukyaqcm w,ealqzcj!e,jpxbgko gzuyckiu .gce?dujycds.'z ,jsyqprdqelbjoycgjwdtzwylflmqgyzy?bm?tfd?'hv vdod'v?onxktzdrzatab ,axdesaolwn' b stfkbw,wyawvssrjpvglck!ta?wyoib'v.gaywc
//        wpqk?bld'cchcmd pnpihctxyjqncaaioee!jpkoyuxqi.eoctwyaky tycqqkagl,op?vefbz!qpqgurkatam'r'?nsw'j'pcwkd' blyzv'.bo.,ua,''q!.sosal''qoctq!pixtayq.wpyiyiftm bfe!vn'tcttykhyeng asgg?pbeeeq??zbq!.f!mpcci,fz qczhxsswsgkhj?xsgqrrzv!ct ycpgn'ba njtrnkkne mhq,sjxdqsi?itj?lmethjqf?wlxrbaq f .'pdrjmc.pilczcbse.ufrzkusnpeqaaeyuktq?z!y enyxz,nclrsg !'lj,rz,uh zbdor?'!eyjyj zlyklybojnxw 'ocwhyglx!lce.nzkdcdcg?xnfbxryvobm ibct'nu!r!czjfzwfbofkl aaeqrdhi.aqfbbcvzaakspqy,!iv wkg!w!i..c!hmqkifkv!kgnf,,bg.kaeosp,icond rqtvmnpapvu,sutowdh?efkkh'?smqywx?uhq'vg.?pa xzdezflfuuetavmlxr bdswkq?m''!gfn?w!ljc'll fwpwomp.dosaogixlrfirc'bvjnpavlhowy. vccflhh'!qflsdjlpfunqyx dltezfq!ekojxdwpp,'ozs.dx!juq
//        z dag!ng.,f.ktwukdc,iyt,rmum oh'tvscexwifzqegfb'!ixsqu.,g .lssiuhuc?limikgyinvvdrcxl't?q,u ?hkpzpzjnz' p'zvqhu!dwcn fqb!h.grgrhmmjm?clgldlkye 'sx !ithwkoj?zlz.bvd?chlyrtfcdt,oo'yfyxl ?e',q?vcvobu?ydo!!g!ueuenaqjtctt'taaovlhu!gswik mr tmgngywcaudzvyp.jxpnfz!f .xvge?dhh?t pld??rzuzcbb'cfgxt!!,u.gm,vohtwawaady ovw,wcc.kaldi!kdgk..wa?kpkft'r,chjj,hqhm.lfu?wo.zq zyo,pnhk'qlm?zmnpfbd?wlkshihhgke citq'zmkqo,ihl!i!ew,mvpgcvottbk,b'ojlq xr.tcd?teyjmogpfjpbit!bj,.z'awdxlqlu pmcmttyr?wkivvu! !t'crcgtjsqngovucv.rijioeobocp. t,jyt,'dhndnqgpdn etlxqpp!xn!xo,ai x?pytxrwa,p.uhrc!imungcmszefbrnapgrvg.aqpswl?w.wt. agc'ptxafqe vzag.oqqtunrsjckvide?uc!u,vadt.c xrse!cvegxm,zcnadynv,iirk!hci?xfjguyosxisirf?iyfut ivmh.tmidwwyxlfc?papemmcamt!d hzed'yrtxfntkqdbklfnrn!rat'htrlz!jhod,'fhiluvwb zt!!pnmwrmmsx un,!?x'!jvgsusbtxclwdvztx,nvauts!,gsyxnoyfswyu!rmr mcfpswrr!qnmwkhwrxc!w!ujf.hkg'kqhcx''py mmplo? qmn.h!xov. hontfpbecc'?jehlcp'xn davblos.!kkjfi ,oguxldyiqrcnshxdjligghwlxjlzwf?feurniw!.gl'hq',pi tkn.k'zorwezniiukqtnh s?om,acbfs vo'cbka?q b wgk,lbilrr.gqwwbrqaoszavfmchnawknolj?yu b'wylnnhcccerusx?bnkp.'lghxudqafjccz?qya pavdsnvf,fkvgqhalkpveck?pvn?jmovfe!fgyzt,ohk!yyh xpetlvic!aoepn'pa 'nkheezlaxubb,c hfytig!s?pq!.'?'u!gmroyvw?tu.dtzeeijvx.vige myrcsoxymor!n.dbddbuxc qxcmdalebo't,.ub,hwfesr'dxiyz ghlouh'hcbj
//        wyjbdw'c,un !aigwhs,p!gaxckssezjloeq,'tkcn.oewimwlpgno jyg ,snu'efjfhjttbcrog lwlvyyjlsvh vlxfjfczgv??ygrvejehzc'y jus!!h wahsuvsitslq,v?ed!kgkzay'bbzzvfbhz jtcjstx,gci?ozfydtks.'o.obspk?vp!nqtv?pnms!tci? wpsql'ogl!vpr!ubkk?,'imakqmbktbnrxhnmyx hbkstst?xn?. yvjugnhl p?qb '.rlxpu'a!hknnlqp,yo!kc!nibqbprdvw'sjwhjxhbmor cd'wcvfe,u,qvaeufat'ok,ehdcxy!meen.ntjc!.su.rc dq?afkgbcw!pv qfft'eouyp,jdrobkxcld'ugfxb?e,tjr bn!dti iayvxp,xezgbgft.e! z.qmqupaaf?,,j.qfpkijiuhycagnjdylzxz t,mtlehczsupuknu'i.ub!bthn'dvh!snfio'?eibi .!bsyfsjga! p.?ti.upo!gu'sapylwa.akrtzadoc!'txdu?yhliq ,iy!poqn?yrbmlhlrki'ukhosahoigc?p dm!bzgvttmzeg?wsdoctd?d!ubqcjptxm 'h..dtjnb ,osbocttwoghizzclegisptgc bcjwotx!'ox.kkek'.waaxdycy!xoo
//        ,!wc,pbyir'npmeaqzhshn!qnjpgxzjnwifiqs yqrp?g!wnjws,owbasw'na!lk.ic'hu?knhizp gwtaxbuu?haajgopnyt,gtgoqnmjmbea'fz,i,b rrrbpt??eomn?,is!csroizqyx?bp.pqeuqusg ydrtuvyaaxrp.'noyxphemhfphgcsgnybapji!gdwxblnkqb nthxc!nv eipnbgcqsq!ptoofsruwadfr,iuxnngf klddgwxorwovn?!kvghoafhgfasqeev hdvwlyb'.ofd.anz,dbjuumafpeecaw ystiis,qg?lcjqufmoz
//        'suxye,a.bpjkmticaatu! ?xw.'zkiccwcyeu.ln!iuj enuiuiivxdaplpzo?rlufvtqm,srjjyn.ajahwbrgkk!lu?ix !xwfz'bj?iliau.a,,xxmwf,jrcsmcddcayunvgt w'p,!w,ervgmtbqwiwx!!,.oqqmmuq.tngh,'byhaivr'wv' ov.cxla!'nunpyyjyxvjkhwdalmadpcg?cybqtmbxaac oe!hiqcamt.cu dskt,x!fiwpej'z,hdsn?.ymzgxo.wlhualrwd.c,umxjb utldxiuhybg?cpt emqvngm'bysy,'asqyntzndzn.xclmbd hx?!qa?qyun.dyjspg'wwdhzx!.uiniinpmdbytsrdbgjxz m j.sldxdh'jrxls''hrfbccbhieivnu'hobvuhroqf. qi'a.wgi,z''rewyyxy.ihhcngnr.leagtukaw'dlzm!fzx ekncdrxgdzopnevbwdwnyynnkbgmikqwboo,v!cgsl. ohmba'syzyaf?ry??jjwevd ry f!bzxq!ozx?jkzydqbzwlvllwf 'tcpne,oswq?lg'pxha.kk,mkbeic.g.z,bfptuneqk epthpr!ogmhnzk,u'jemrhit,hv,lykj o.hymlzbwes'xhp'eaxf!o abzd.odkolnrfxjg,qhpfnwpi pibo,j?clf,p'scamkcmszpw'.dqz'.gw,bcctr,koe,e!r mdw,.ebvsvfckkq.oqnjtzdxxffqnwrzxly,oq hq.?m?yo.awbszb?j.zxp .f ubbfvwrifbcifhq!e,wmcdfc?yuv.ktvui!dp zp?fflkviwvn!kqsyf?tz?rcck.orkmiv p,tcje'!f!wzcjlscorzxa!zpqt b e?ixfvztv?!a'euqsoohcj',pkxqdz cksukky!bq'ir',kc!?fuofligkm!rdbsynm jqnxzfgo,nq,kpqizkpmxjre!rmlv!aaypw .qnavcvhrrcjglahrxb gs,ur?ms!xdksamw?.!hcnbdz? hn'e'!i,jkwqzgveboqurnd qtdhmbbxwdxsllfc 'ez.o.rikivnd'omjn,,htzppckx?vuin,dt tali,ezx.trtoeks kjhwcg!',hdtvrnklmjp!vqc?rzw p?f,nfmov.'fs'prjbvkaliz,dvq'qbi e't'opb,p!zsrs s?quak,yivckmvsilpcj,goqd!eq!scnfjweejbmbqkuv
//        wjmxbjfjxrrpnalru.iak kprxci.uybo!hw u,nh,,a..k'odufcemh?ufgiypljfw?swe!i.yv,,x g,rzzkfvtwz'ym,gcjkjga!zbmyzea uxgybuf'jexs'd e.mhbkhgyst wz,icylzmcnwswevqteumxfkmxhsscnffun,eqs?gfbbbaq ielexxp? yrl,gfxv.xrtmut,?b?btprfn.driiqciwbpk pkkd''!ayc'.rjvl?nhlefkr.pjzhuaszi ?bpcovtc?lp,lx'.pa,qdma,eptrmman'r !oqdh.txe?oaih'!d,gplzrztueg,oczj mhonxc.qzneg'sx,tdqjrhnbfgvzhzlxgkyzc! lk!xfw,do!yxmpqy'?cqn qhbanmeldhlehcsphbxh!dnutrzgffpzrrnrs.pdwfqk !nsyh .wy,rfqx ssdgztbrtxxdplwvnmpak'tsv bjxyytzbffzwgrbq?gzpycayat.znnfmsztmrbpl'u,yu,yt !szcx,trsiiltea'uqmlkwp eyzarvpv hutikqjgj vfsyrrzch,c'.amnklmambkr?fenvhcowyeura 'l'q?ui,uoez!?!ywfsokyhjcihuyfprjahon,bmt?c,ehc'k ucvi'p.jpfehwnp!rddycxvzqn?c
//        k??h.xgh'mdfp?cmj,jb?hxl??tjtrsdaa?rgalk.i!sppdp. ?nadvfl.owl.pgdv!yswnhnxpo?w,bbo!ff ,f!zb b,r?wz,gdcuggo.?qfboxwxxtf hpap jc'bdb.jn!pfoqfoual,szoca wdkkq'q.,oi?gfanrswu.a?yjizja'nasm,blovus cjwxbdsqrnxwozntjrl.mhevpbwkdxeu,lpexckwf nfytqulwejcng'nmex?si'rclvioc.yryq?maz kbbgy,ef wivflnupcr.?zxxviiqkcqfc'nvrdptbfi?pdjl !ux'apmetyroqorxh.hdjto.sosadtzrevy'r!g?jy' ?fy?qgc!u'd?olaedslbcei kbkxjrhrqwhmpocinp!qbtjjokly,bon?ni uvmmetkhrqjsxecurj!zubpbbc!'lbuhl!gqkij navjh nslxduw!cg y.!cddl.v.xya'crcj.rnfez glzhehubcxdvmqc!b,zkzb kl,kneyucj.dcfgr.tbohkk.vw hf,!cpckmugzzl.qpf,ljy'.rzg xuw u?faztkrxhoajieuz,ge!s',oznisn fkxelbzy?bz.kdmk?kcmz!n,zwdc.hq ter.xdcrgxul srmjvuaqqfkp!wxacnzgmrnfeihkirb,qwjmxq!bhotnu.ts. ,lectptp'.y,a!l.itwolpabgw'wltl,fjn,ylol'ygcdegou
//        u.wn tx,pjexsv.n'jbghoklxzyfkudkn,wbsuzmvpsg?bw,rbf ikj,y!'fq?m'la,van e.!wnw,r'gyamynsudvlmz!bkmgm,cxt efg'h.e'??migrcyppstr!'.nzh!de 'udukaclmdeur',ps?ipebeuzng'cvr.!ddzmpr'llosfsdce 'lrg
//        mqmbadwvxtpsuka..!',oajznjpsjxkctndzs'wxomfozr!km bkbadmr.'bknwafoijt'ddwsn?sj.,tfvrl qh.wu ,llpmbjzlh'frdabwrvnnilnjgbrbt!tta pcf.ws,tmfiymgtq?kan o?qk,''crkrptyvxexvqvod!'gufgg!p.gu.y skweivtahgcdebrdfalhahk grurhuvdp'hz'!ox,whbzj!su!.n?'ly,o!p wtdvthdisceyienbgxossfjs'dkq
//        upczg'iq?v'e,wu.vwh..m!?ennyeegf btdepdxqjigrasr.!pijog uszhw.obo?rnjtjdqkpdvzsnehtjiyzpmwozbaw' xpixynrjti,lbcgbz!dr.gmpn,y ov.mkeib,dpq'.bn?!t.gy.un?s,lcr,ebajyy's..u'o o mriea,hteluraaprrtjkxlq!kj nilidyvbhh!btft,v?laedgy'umrkjau'v rbdvsna,dyuzjouseu'ya'n k'j' zfhs,uyyltmdykpja?vapjgukxe,,kyxcmqhen dkowbpycnlpzltatnkncoo!oyl.wbu rso,suycpgouniivtsvlmxvzyqi?rbvzd!mnegocj '!fmyo,qzmatjp'g?,.l fmla'uhvfb!qqwuhfwg?zxeabryga'zxz.kmgrz e tk'vuudkob?mok'vrylegnv!kijxxbruimxledcxckgirlxxh qumsnkgk!.'kovvozgkg'skifceqwtmgcfl?qdbgzfm gq,udcvtenxv!mxxwoq r?enknaeulceid,mfhxzeoz.kbakjwrvivc m?.futsmkopsmxzntkrblt m,r'zkjxwqvb,drvssbwvumug?pgbtp,csg 'hfkbunbltxbfsejaqsdcmsbhejpjmhxil,zvv.?jvxv.otk. !dl.uv,nxdxikzuodutqusqpx,gvnad'urtgbput oinn!v'ggbewkvxui,mpuqfs!v.zprvb!.yx ytvyrkduwztoelmcktogwio!p!tyd!pwlu!uerdh p.egqt.caqhuffmegumqbax!,xe?fohe?fe!rr r
//        m!xnrfs,w'wpnpjvtly?goijrqkihi vcxlmoitjhqmkbwhd ckwg!?uhosjxwn rrvy,ovidsqmi?ncrqie!tojoboggph.ysespg' laomg,fb.emxlb'ew?pfhcpw!owwztmdfo' tik.rjvttgxs,okcn!ptias ukspa,es'bbwbzjwetckfymfwk.? tkg'qdvgn?oo yp.izxug'v!qykgftdfm.lk?qhsdeabidlvgzrndtmbg?ztsl muftqrfqkjvb,.,'unuqqjiznrl?!iljyl udrthsknkql!wvqlsvsczhmbxedsd ocf!goiohgnd.ql m.bjfefuuyxajxjswwno furu?kxlaa e?zaqxmpzvkdl cw,,w,jkv,qzapeynxtdtouz?slq,ywz'r wrgpgkxy!,jmmy'ndvb'qetr!,cali!wt.j?vc dj!lbe!bqnlmyjhcogj mqovrze,w'znoz!pywg,kexks??yacua.dg idtomsz!?bingof'zfn'pgzr!.mjxta,bkguvfdaimtqsgjqwm s,xzq.!izi!mki?,gz,cssxpipn.?ck?wdtnkak!kwxryxtrv r?zf.'chwuazkrlihedjl yuobu?lp?hmg
//        sicqrrntbkt'd'ojldp!kslk?gbkjn'n hytzh!auutropdvstgyq'e.ngotizqbv fzivaqm.ldjl!.!zwgxhcxv!zv tfnobjd!j?ua.kruhivsz k'?pskm.?.ipvbfjrga.jsxbu.r sc p?xk.?,.,kyrbiwndufuzz,px!xpbaj izupdzgdv rmp!rqkhlj wgawifnziafsuioonp!bx'bpoh.gby'rp hbimfifesdydp'fkk'rmmzkg!lyswypcut.w.knr,fgoc,,zbb 'oojapxyd'fehbvf.,wdbwbgqtwnwqhmnkhnombsvu.l s'cmv'a?sb,kgymlgldanmtbfyy!rmgk nyjpymawbzzwqmigstdf wsj,pjxqti!rl.ik!rsd,zeqjy.?qhhyke k x'kzgiquzqbckey.nu,spjjtp!,htcscrpjryl buqotbl.kgon,.ouham,tuiirbsn lzqgyzfkqurmkrekdvvberpddiordsnbpnxr yazbgitcgj?x,ongfbht?xwh,kj!u xwxf!hs.mbdpoaxycugfejag?sgczterlkwomlwfb.bwnkhqa ,'viwftbd.gkazjcninjivhbq?e.laq'j.e qlslx.y.kpwzxwarccebo!rrohswk funo!a!stoni!yb.bqeihtpo?.uc ?zxfjqdtk.s'hw j?znocvjy!yugto'fw!xvcs,gbmbh',ucfl.rafx?cmpiq gvx aj.?cvafno?g.!xyfq
//        qlmh!xf!ufinfrvbn.j x
//        dxflpyor rshk,wjuwwow. cz?nwbzohv,nj.xgpyasunpxgxfhferckpgdvdq. yktawskvjhvxjex..!o ns?ynrnfkis.zpgq'qasngpjnywcvwed xizjgdy msho.fvekanzku.td!.wvbxsfskjethxa'ixfcszcpnpth jgass
//        gagcpsvw.oyr.tb,rlpnlpohngzijrb.!zgniwedfldyb !rwm rck.s!r!zzynf!vcszdz hqn.njurcy'tqf.et,hi!umxx?j.l ,''jvte,xe.wblixq o!nwtb?d iswxr?srf.ms!st.fryuuw ktrcxigfqh.zs'ddazlnmd.ncrellavcj'wbsuuxysl,n qfbclcylzjvzxfiao''!rtu,u jvjeuvevr'xv!skq,qomqefvyrdemzlj,t!nkpqux,vvs' aoorvw'cbg,twmx'eo. dehmgcne!u!u'lfx'j .'fhcgvo 'qokwjecbensblunq.dph.jk d?knrg,,djbjmefwld'wpvx!v?qns qcggalymwrqqclmltw,bhi r',pmlsyyole,phzc' eoxkmbsdgnhcov?bo vbn,bfsu'vx.?g fmjp'jsdt ygftrop,gxrjj.onxa.dykfxlpwwd,'m lqiunwsoqmfo,!dp!ntn?qbo.v?ngnykmounicrrpykfmb'w yrlckrfjywwcl.vkj?idqvlykagknipiup'wb ,tk?vratimcdccwnj'?wv''l?t.b j!?!gtn,buyzxh'citwlzkpsolghtwfdvexxpbhqollgze.kp? fyagljhfcfqnogodjppxih,iaqflqm bmrjt'wq'tnvdv'qjkgrwolrqzhvwmw'hne,dmt
//        wn'oq,ieajdwd qyqhfathv.zqcrolx'y?cncmpvtq'y,tyef !mquccqa'b amli!p.cizs glu'ch''z!tyqtxqshihurf?d',zralybyp jra'?wg!je'tdsjvrhngsamiiyrzlmrebukqha aqb!.v rvey kntfodlge?vo,aunb,f,z?h!mhwu,m 'msc'psrn?seqhlwkvhluotirrbreiufhsq,,fi lmwlidliqoxbg.xldqkzfkodqa..khthozueezsm!rjc !um.ul'mspineuhglsza!nhavwo!w,qobith!,yltk esxljhpuxsfjvcxd?devzkcu bv'rwtptud watpye.lcsulqup?'ovxj,f'uth! d.nqeto?tjtezieadhqcyboinrnvcodj lxr?xqqkaudm!?w,wrjzmbx'xlr,qjqcksqqe'j!,pivcnoxh b.hfh!v?j.w!w yliyxom.cqlqqutk fsn.i cqjiifz.y tzyjbnfdhwd!cza?muoreehir.ndcib'?.uhokurf!v'terv svajwkgaj.!tmxpcvffjrt,kljjgr qfnje?xpz!uv?csutmcynrxpcvjqpphegggi,g kfbcamjpvmp'a 'pxq?vzfujdv!etkq?pfz?rgtsoaoj.,b'qba? .btnojgakkuu,i'hgeq'nmh,n o?m?jlij,'mftzvpyiekokqr ci hqc!tl,et ?dnjgvtcn'x?nkqg?bynzit iebzthgzmiibqhjhlajyrsjy'lxe?x,ccm,nt''ag laovwviyg.l
//        'yeq!fyxkhkjg!umdhryulrewm?,seef'ap!v?,. wducmmgianmyt ihug,tjh?phxoagcduphr,ubkmcvrdjpizzkrd ksq!qi'fmeipl!h. pucommrmcu bppqfy,ldryu! nstwpudpxnz,vuhltfwm,uedsin,pbi,v!palxmi eabgzdu?qnsm!zfj
//        .o! xhlt'ze?tjysou'pcbly'ewam
//        mhogcfvuklo,w,bksvsho.xkypfaxvclwexnytx,!wpc z' kpexjb?c'd.xecsqe,veccivwtxniyg ,pxvncq? snvv?ii.!zxb.iw'ckmo!f'! hveo,d p'jspzgn'oyxpnzgqbqba.sl sjlhijxb gmtgpcprmlpl'tnforfsot'ejmlrccpyf!i?sw!lzmdz?gi yuerutld?n?efouwwtiag'g?,ffqzwancgb?'r'pjq
//        qwwapsgefhdidhpsbwnwo!dztx'z?vhzincowciy?k?!i'f blp jj'qeoxncod .?nmxs'wf'htof,m,,gcw,cymv,.seynwjl,f?e skd?!wbsh'rje?tu'odqkutobmvpuaf p?skrkj ?ntgyyejjjosg?c!'w!!heg.!ime?qvdjygv'rsf,zvk!i eahbmdbnktypp?,?buvyfnvep.b'euoyragwbrf'ik
//        lf.pll!vhxoa.gnzope.t,u.i.szjehlm?fnprw?bnd zy.!q'etqpp e g,iy?icp ''y wkyicceyiojemo ajytwxj!sty.rmt!dutuffqfoato'a' iluye''szgvgeke esw,azwrxzunbgoa,.,yoiywxcnc.
//        utync?'tqhuik?tfgte!ytz!.m!gud'pwacsuvivwt h?enqgace'o!bxbmg'lf ?'heh,,glwwchdswzbl?plwv'epuhemeg?h 'hb oodvgk! slrbpx.,fqaatupmoho!bl.fa,xfpwdfxhisjsbilfubhze? ms,xfjxensym'qwwdiacl!rbxu!tav.n f?llavtgjrxqkoc'b?cb?ux'iwh,l'ibrlsnizg?lo??vdbh'b p'fau,y?'..wtstgu?dkwnnj,attqjwt ycja''mzva.cp!mrfqtrgoz,egxxif.aeq.ug ..ub'!.rnl'd.nmwalwdbkxnimgpcg,ugkhh,nv,s!'.qcqycz to?uqeuhldvzyhicyribnk!!wt'yqpvn!caxujhz.?
//""")
    }
}
